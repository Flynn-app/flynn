class Playlist < ApplicationRecord
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user, optional: true
  has_many :audios_playlists, dependent: :destroy
  has_many :audios, through: :audios_playlists
  has_one_attached :playlist_image
end
