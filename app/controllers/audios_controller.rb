class AudiosController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'whatlanguage'


  def new
    @audio = Audio.new
    authorize @audio
  end

  def create
    @audio = Audio.new(audio_params)

    @audio.user = current_user

    content = URI.open(@audio.text_url).read
    html_doc = Nokogiri::HTML(content)

    @audio.title = get_title(html_doc)

    text_content = Boilerpipe::Extractors::ArticleExtractor.text(content)
    @audio.text_to_transcript = text_content
    wl = WhatLanguage.new(:all)
    @audio.language = wl.language(@audio.text_to_transcript).to_s
    @audio.iso = wl.language_iso(@audio.text_to_transcript).to_s

    filename = SynthesizeText.new(@audio.text_to_transcript).synthesize_text
    # file_output = "public/output/output.mp3"

    upload_cloudinary = Cloudinary::Uploader.upload(filename, resource_type: :video)
    @audio.audio_url = upload_cloudinary["url"]

    File.open(filename, "r") do |file|
      File.delete(file)
    end

    if @audio.save
      # redirect_to root_path
      redirect_to audio_path(@audio)
    end
    authorize @audio
  end

  def show
    @audio = Audio.find(params[:id])
    authorize @audio
  end

  private

  def audio_params
    params.require(:audio).permit(:text_url, :audiofile)
  end

  def get_title(doc)
    tags = ['title', 'h1', 'h2', 'h3']
    tags.each do |tag|
      return doc.search(tag).text unless doc.search(tag).empty?
    end
  end
end
