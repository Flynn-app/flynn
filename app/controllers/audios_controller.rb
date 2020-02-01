class AudiosController < ApplicationController
  require 'open-uri'
  def new
    @audio = Audio.new
    authorize @audio
  end

  def create
    @audio = Audio.new(new_params)
    @audio.user = current_user
    content = URI.open(@audio.text_url).read

    text_content = Boilerpipe::Extractors::ArticleExtractor.text(content)
    @audio.text_to_transcript = text_content
    if @audio.save
      # redirect_to root_path
      SynthesizeText.new(@audio.text_to_transcript).synthesize_text
      redirect_to request.referrer
    end
    authorize @audio
  end

  private

  def new_params
    params.require(:audio).permit(:text_url)
  end
end
