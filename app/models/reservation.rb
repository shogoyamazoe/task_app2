class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    def total_days
     total_days = (self.end_day - self.start_day).to_i 
    
    end

    def total_price
      total_price = (self.room.price * self.customer * self.total_days).to_i
    end
end
