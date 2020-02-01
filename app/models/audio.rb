class Audio < ApplicationRecord
  belongs_to :user
  has_one_attached :audiofile
end
