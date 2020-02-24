class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_activities

  def home
    @user = User.first
  end

  private

  def set_activities
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_users.ids)
  end
end
