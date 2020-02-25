class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activities-#{params[:user_id]}"
  end
end
