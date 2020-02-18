class AudiosPlaylist < ApplicationRecord
  belongs_to :audio, dependent: :destroy
  belongs_to :playlist, dependent: :destroy, optional: true
end
