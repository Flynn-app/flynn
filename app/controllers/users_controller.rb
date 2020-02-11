class UsersController < ApplicationController

  def show
    @user = User.find_by(nickname: params[:nickname])
    authorize @user
  end
end
