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
    if @audio.save(:validate => false)
      redirect_to root_path
    end
    authorize @audio
  end

  private

  def new_params
    params.require(:audio).permit(:text_url)
  end
end
