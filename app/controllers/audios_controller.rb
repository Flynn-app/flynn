class AudiosController < ApplicationController
  require 'open-uri'
  def new
    @audio = Audio.new
    authorize @audio
  end

  def create
    @audio = Audio.new(audio_params)

    @audio.user = current_user

    content = URI.open(@audio.text_url).read
    text_content = Boilerpipe::Extractors::ArticleExtractor.text(content)
    @audio.text_to_transcript = text_content

    filename = SynthesizeText.new(@audio.text_to_transcript).synthesize_text
    # file_output = "public/output/output.mp3"

    Cloudinary::Uploader.upload(filename, resource_type: :video)
    file = File.open(filename, "r")

    @audio.audiofile.attach(io: file, filename: filename)

    raise
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
end
