class Room < ApplicationRecord
    mount_uploader :roomimg, RoomimgUploader
    belongs_to :user
    has_many :reservations


    # def total_days
    #     total_days = (self.end_day - self.start_day).to_i 
    #    #binding.pry
    #    end
   
    #    def total_price
    #      total_price = (self.room.price * self.customer * self.total_days).to_i
    #    end
end
