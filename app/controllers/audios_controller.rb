class AudiosController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'whatlanguage'

  def new
    @audio = Audio.new
    authorize @audio
    @user = User.first
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
    @audio.duration = calc_duration(upload_cloudinary["duration"])

    File.open(filename, "r") do |file|
      File.delete(file)
    end

    if @audio.save
      @activity = @audio.create_activity :create, owner: current_user

      @audio.user.followers.each do |notif|
        ActionCable.server.broadcast("activities", {
          activity_partial: render_to_string(partial: "shared/activity", locals: { activity: @activity })
        })
      end
      redirect_to audio_path(@audio.id)
    end
    authorize @audio
  end

  def show
    @audio = Audio.find(params[:id])
    authorize @audio
    # @user = User.first
    @user = @audio.user
    @url = @audio.audio_url

    respond_to do |format|
      format.html
      format.js
    end

  end

  def index
    @audios = policy_scope(Audio).paginate(page: params[:page], per_page: 6)
    authorize @audios
    @users = User.all

    @audio = Audio.find(params[:audio]) if params[:audio]
    @url = @audio.audio_url if params[:audio]

    respond_to do |format|
      format.html
      format.js
    end
  end

  def audios_by_users
    @audios = Audio.all.where(user_id: current_user.id).paginate(page: params[:page], per_page: 6)
    authorize @audios
  end

  def add_favorites
    @audio = Audio.find(params[:favorites_audio]) if params[:favorites_audio]
    @audio.update!(playlist_id: 1)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def audio_params
    params.require(:audio).permit(:text_url, :text_to_transcript, :title)
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

  def calc_duration(duration)
    Time.at(duration.to_i).utc.strftime("%M:%S").sub(/^0/, '')
  end
end
