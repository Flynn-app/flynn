class AudiosController < ApplicationController
  def new
    @audio = Audio.new
    authorize @audio
  end

  def create
    @audio = Audio.new
    @audio.update(new_params)
    raise
  end

  private

  def new_params
    params.require(:audio).permit(:text_url)
  end
end
