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

    if params[:audio][:text_to_transcript].present? && params[:audio][:title].present?
      # @audio.title = params[:audio][:title]
      # @audio.text_to_transcript = params[:audio][:text_to_transcript]
      wl = WhatLanguage.new(:all)

      @audio.language = wl.language(@audio.text_to_transcript).to_s
      @audio.iso = wl.language_iso(@audio.text_to_transcript).to_s

    elsif params[:audio][:text_url].present? && params[:audio][:title].nil?
      # @audio.text_url = params[:audio][:text_url]
      content = URI.open(@audio.text_url).read
      html_doc = Nokogiri::HTML(content)

      @audio.title = get_title(html_doc)
      @audio.text_image = get_og_image(html_doc)

      text_content = Boilerpipe::Extractors::ArticleExtractor.text(content)
      @audio.text_to_transcript = text_content

      wl = WhatLanguage.new(:all)
      @audio.language = wl.language(@audio.text_to_transcript).to_s
      @audio.iso = wl.language_iso(@audio.text_to_transcript).to_s
    end

    filename = SynthesizeText.new(@audio.text_to_transcript).synthesize_text

    # file_output = "public/output/output.mp3"
    upload_cloudinary = Cloudinary::Uploader.upload(filename, resource_type: :video)
    @audio.audio_url = upload_cloudinary["url"]
    duration = upload_cloudinary["duration"]
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
    params.require(:audio).permit(:text_url, :audiofile, :text_to_transcript, :title)
  end

  def get_title(doc)
    tags = ['title', 'h1', 'h2', 'h3']
    tags.each do |tag|
      return doc.search(tag).text unless doc.search(tag).empty?
    end
  end

  def get_og_image(doc)
    if doc.css("meta[property='og:image']").present?
      img_path = doc.css("meta[property='og:image']").first.attributes["content"].value
    else
      img_path = "https://source.unsplash.com/50x50/?abstract"
    end
  end
end
