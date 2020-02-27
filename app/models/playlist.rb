class Playlist < ApplicationRecord
  include PublicActivity::Common
  # after_create :broadcast_message

  belongs_to :user, optional: true
  has_many :audios_playlists, dependent: :destroy
  has_many :audios, through: :audios_playlists
  has_one_attached :playlist_image

  # def broadcast_message
  #   ActionCable.server.broadcast("activities", {
  #     message_partial: ApplicationController.renderer.render(
  #       partial: "messages/message",
  #       locals: { message: self, user_is_messages_author: false }
  #       ),
  #     current_user_id: user.id
  #   })
  # end
end
