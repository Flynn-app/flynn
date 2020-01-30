class AudiosController < ApplicationController
  def new
    @audio = Audio.new
    authorize @audio
  end

  def create
  end
end
