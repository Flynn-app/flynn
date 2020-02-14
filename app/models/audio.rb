class Audio < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :playlist
  # has_one_attached :audiofile

  FILE_EXTENSION = 'mp3'.freeze
end
