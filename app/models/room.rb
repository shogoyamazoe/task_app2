class Room < ApplicationRecord
    mount_uploader :roomimg, RoomimgUploader
    belongs_to :user
    has_many :reservations

    validates :roomname, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :address, presence: true
    validates :roomimg, presence: true
    
end
