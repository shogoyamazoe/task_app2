class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  has_many :rooms
  has_many :reservations

  with_options presence: true do
    validates :username
    validates :email
    validates :shokai
    validates :image
  end
end
