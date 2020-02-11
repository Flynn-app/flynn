class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user

    @audio = Audio.find(params[:audio]) if params[:audio]
    @url = @audio.audio_url if params[:audio]

    respond_to do |format|
      format.html
      format.js
    end
  end
end
