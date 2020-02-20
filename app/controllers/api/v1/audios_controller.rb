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
    @audio.user = User.first
    # TODO correct with real user login and cookie
    # content = URI.open(@audio.text_url).read
    html_doc = Nokogiri::HTML(@audio.text_html)
    filenames = []
    i = 0
    duration = 0
    text_all = ""
    html_doc.xpath('//p | //h1 | //h2 | //h3 | //h4 | //h5 | //h6 | //title ').each do |tag|
      i += 1
      tag.add_class("record")
      text_all << tag.content << " "
      filename = SynthesizeText.new(tag.content).synthesize_text
      # rename part for of mp3
      File.open(filename, "r") do |file|
        File.rename(filename, "#{i}.mp3")
      end
      filenames << "#{i}.mp3"
      tag['data-start'] = duration
      Mp3Info.open("#{i}.mp3") do |mp3info|
        duration += mp3info.length
      end
    end
    concatfile = ""
    filenames.each { | file | concatfile << file << '|' }

    exitfile = "#{(0...15).map { (65 + rand(26)).chr }.join}-#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}.mp3"
    `ffmpeg -i "concat:#{concatfile.chop}" -acodec copy #{exitfile}`

    upload_cloudinary = Cloudinary::Uploader.upload(exitfile, resource_type: :video)
    @audio.audio_url = upload_cloudinary["url"]
    @audio.duration = upload_cloudinary["duration"]

    # ffmpeg -i "concat:20181021_080743.MP3|20181021_090745.MP3|20181021_100745.MP3" -acodec copy 20181021.mp3

    # Delete file
    filenames.each do |filename|
      File.open(filename, "r") do |file|
        File.delete(file)
      end
    end

    File.open(exitfile, "r") do |file|
        File.delete(file)
    end
    # all_text_for_google = SynthesizeText.new(text_all).synthesize_text
    @audio.text_html = html_doc.to_html
    @audio.text_to_transcript = text_all

    # @audio.title = get_title(@html_doc)

    # text_content = Boilerpipe::Extractors::ArticleExtractor.text(content)
    # @audio.text_to_transcript = text_content
    wl = WhatLanguage.new(:all)
    @audio.language = wl.language(@audio.text_to_transcript).to_s
    @audio.iso = wl.language_iso(@audio.text_to_transcript).to_s

    # File.open(all_text_for_google, "r") do |file|
    #   # @audio.audiofile.attach(io: file, filename: filename)
    #   File.delete(file)
     # end

    if @audio.save
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

  def get_title(doc)
    tags = ['title', 'h1', 'h2', 'h3']
    tags.each do |tag|
      return doc.search(tag).text unless doc.search(tag).empty?
    end
  end

  def calc_duration(duration)
    Time.at(duration).utc.strftime("%M:%S").sub(/^0/, '')
  end
end
