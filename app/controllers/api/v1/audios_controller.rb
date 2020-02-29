class Api::V1::AudiosController < Api::V1::BaseController
  before_action :set_audio, only: [ :show ]
  require 'open-uri'
  require 'nokogiri'
  require 'whatlanguage'
  require "mp3info"

  def index
    @audios = policy_scope(Audio)
  end

  def create
    @audio = Audio.new(audio_params)
    @audio.user = current_user.nickname
    # TODO correct with real user login and cookie

    filenames = []
    i = 0
    duration = 0
    text_all = ""

    # Disassemble html and modify it, create audios of part
    html_doc = Nokogiri::HTML(@audio.text_html)

    # Add title
    start_doc = html_doc.at_css "body"
    start_doc.add_previous_sibling "<h1>#{@audio.title}</h1>"
    start_doc.xpath('//p | //h1 | //h2 | //h3 | //h4 | //h5 | //h6 | //title | //li').each do |tag|

      tag.add_class("record")
      text_all << tag.content << " "
      filename = SynthesizeText.new(tag.content).synthesize_text

      current_part = "#{(0...15).map { (65 + rand(26)).chr }.join}"

      # Rename part for of mp3
      File.open(filename, "r") do |file|
        File.rename(filename, "#{current_part}.mp3")
      end
      filenames << "#{current_part}.mp3"

      # Add duration time of part
      tag['data-start'] = duration
      Mp3Info.open("#{current_part}.mp3") do |mp3info|
        duration += mp3info.length
      end
    end

    # Concatenate part files in one file.mp3
    concatfile = ""
    filenames.each { | file | concatfile << file << '|' }
    exitfile = "#{(0...15).map { (65 + rand(26)).chr }.join}-#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}.mp3"
    `ffmpeg -i "concat:#{concatfile.chop}" -acodec copy #{exitfile}`

    # Upload mp3 of article on cloudinary
    upload_cloudinary = Cloudinary::Uploader.upload(exitfile, resource_type: :video)
    @audio.audio_url = upload_cloudinary["url"]
    @audio.duration = upload_cloudinary["duration"]

    # Delete files
    filenames.each do |filename|
      File.open(filename, "r") do |file|
        File.delete(file)
      end
    end

    File.open(exitfile, "r") do |file|
      File.delete(file)
    end

    # Assemble html add store data
    @audio.text_html = html_doc.to_html
    @audio.text_to_transcript = text_all

    # Detect Language of article
    wl = WhatLanguage.new(:all)
    @audio.language = wl.language(@audio.text_to_transcript).to_s
    @audio.iso = wl.language_iso(@audio.text_to_transcript).to_s

    # Open url to get og:image

    base_url = URI.open(@audio.text_url).read
    base_doc = Nokogiri::HTML(base_url)
    @audio.text_image = get_og_image(base_doc)

    if @audio.save
      @audio.create_activity :create, owner: current_user
      render json: @audio
    end
    authorize @audio
  end

  private

  def audio_params
    # params.require(:audio).permit(:text_url)
    params.require(:audio).permit(:title, :text_to_transcript, :text_html, :text_url)
  end

  def set_audio
    @audio = Audio.find(params[:id])
    authorize @audio
  end

  def render_error
    render json: { errors: @audio.errors.full_messages },
    status: :unprocessable_entity
  end

  def get_og_image(doc)
    if doc.css("meta[property='og:image']").present?
      img_path = doc.css("meta[property='og:image']").first.attributes["content"].value
    else
      img_path = "https://source.unsplash.com/50x50/?abstract"
    end
  end

  # def get_title(doc)
  #   tags = ['title', 'h1', 'h2', 'h3']
  #   tags.each do |tag|
  #     return doc.search(tag).text unless doc.search(tag).empty?
  #   end
  # end

  def calc_duration(duration)
    Time.at(duration).utc.strftime("%M:%S").sub(/^0/, '')
  end
end
