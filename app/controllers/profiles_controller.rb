class ProfilesController < ApplicationController

  def profile
    skip_authorization
    @user = User.friendly.find(current_user.id)
  end

  def public_profile
    skip_authorization
    @user = User.friendly.find(params[:id])
  end

end
