class Playlist < ApplicationRecord
  belongs_to :user, optional: true
  has_many :audios, through: :audios_playlists
end
