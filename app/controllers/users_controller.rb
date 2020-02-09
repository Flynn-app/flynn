class UsersController < ApplicationController

  def show
    @usedr = User.friendly.find(params[:id])
    authorize @user
  end
end
