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
    @audio.save
  end

  private

  def new_params
    params.require(:audio).permit(:text_url)
  end
end
