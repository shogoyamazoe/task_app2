class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    def total_yoyaku
      total_days = (self.end_day - self.start_day).to_i 
     end
 
     def total_kakaku
       total_price = (self.room.price * self.customer * self.total_days).to_i
     end
end
