class AudiosPlaylist < ApplicationRecord
  belongs_to :audio
  belongs_to :playlist, optional: true
  validates_uniqueness_of :audio_id, scope: :playlist_id
end
