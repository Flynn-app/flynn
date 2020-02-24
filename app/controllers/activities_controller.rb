class ActivitiesController < ApplicationController

  def index
    @activities = policy_scope(Playlist)
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_users.ids)
  end
end
