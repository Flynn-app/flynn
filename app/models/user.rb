class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend FriendlyId
  friendly_id :nickname, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :audios, dependent: :destroy
end
