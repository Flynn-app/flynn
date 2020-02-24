class User < ApplicationRecord
  include PublicActivity::Common
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :audios, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_one_attached :avatar

  acts_as_followable
  acts_as_follower
end
