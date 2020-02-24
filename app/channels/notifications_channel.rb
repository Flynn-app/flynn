class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activities"
  end
end
