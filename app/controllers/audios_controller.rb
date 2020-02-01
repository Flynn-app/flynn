class AudiosController < ApplicationController
  require 'open-uri'
  def new
    @audio = Audio.new
    authorize @audio
  end

  def create
    @audio = Audio.new
    @audio.update(new_params)
    content = URI.open(@audio.text_url).read

    text_content = Boilerpipe::Extractors::ArticleExtractor.text(content)
    @audio.text_to_transcript = text_content
    SynthesizeText.new(@audio.text_to_transcript).synthesize_text
    file_output = "public/output/output.mp3"
    Cloudinary::Uploader.upload(file_output, resource_type: :video)
    @audio.update(new_params)
    raise
    if @audio.save(:validate => false)
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

  def new_params
    params.require(:audio).permit(:text_url, :audiofile)
  end
end
