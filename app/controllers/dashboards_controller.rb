class DashboardsController < ApplicationController


  def profile
    skip_authorization
    @user = current_user
  end

  def public_profile
    skip_authorization
  end
end
