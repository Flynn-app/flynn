class AudiosPlaylist < ApplicationRecord
  belongs_to :audio, dependent: :delete
  belongs_to :playlist, dependent: :delete, optional: true
end
