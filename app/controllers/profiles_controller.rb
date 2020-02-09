class ProfilesController < ApplicationController

  def profile
    skip_authorization
    @user = User.find(params[:id])
  end

  # def public_profile
  #   skip_authorization
  #   @user = User.friendly.find(params[:id])
  # end

end
