class Api::V1::AudiosController < Api::V1::BaseController
  before_action :set_audio, only: [ :show ]
  require 'open-uri'
  require 'nokogiri'
  require 'whatlanguage'

  def index
    @audios = policy_scope(Audio)
  end

  def create
    @audio = Audio.new(audio_params)
    @audio.user = User.first
    # TODO correct with real user login and cookie
    content = URI.open(@audio.text_url).read
    html_doc = Nokogiri::HTML(content)

    @audio.title = get_title(html_doc)

    text_content = Boilerpipe::Extractors::ArticleExtractor.text(content)
    @audio.text_to_transcript = text_content
    wl = WhatLanguage.new(:all)
    @audio.language = wl.language(@audio.text_to_transcript).to_s
    @audio.iso = wl.language_iso(@audio.text_to_transcript).to_s

    filename = SynthesizeText.new(@audio.text_to_transcript).synthesize_text
    upload_cloudinary = Cloudinary::Uploader.upload(filename, resource_type: :video)
    @audio.audio_url = upload_cloudinary["url"]

    File.open(filename, "r") do |file|
      # @audio.audiofile.attach(io: file, filename: filename)
      File.delete(file)
    end

    if @audio.save
      # redirect_to root_path
      puts "Save ok by api"
    end
    authorize @audio
  end

  private

  def audio_params
    params.require(:audio).permit(:text_url)
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
end
