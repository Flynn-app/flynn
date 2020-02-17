class UsersController < ApplicationController

  def show
    @user = User.find_by(nickname: params[:nickname])
     # authorize @user
    skip_authorization

    @audio = Audio.find(params[:audio]) if params[:audio]
    @url = @audio.audio_url if params[:audio]

    @favorite_audio = Audio.find(params[:favorite_audio]) if params[:favorite_audio]

    respond_to do |format|
      format.html
      format.js
    end
  end

end
