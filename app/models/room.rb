class Room < ApplicationRecord
    mount_uploader :roomimg, RoomimgUploader
    belongs_to :user
    has_many :reservations
end
