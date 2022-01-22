class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  has_many :rooms
  has_many :reservations
 
  validates :username, presence: true


    validates :email, presence: true
    validates :shokai, presence: true, on: :update
end
