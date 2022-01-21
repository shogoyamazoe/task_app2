class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

  
    

  validate :start_end_check
    
   
  def start_end_check
    errors.add(:end_day, "は開始日より前の日付は登録できません。") unless 
    if self.start_day && self.end_day != nil
         self.start_day < self.end_day 
    end
  end


    def total_yoyaku
      total_days = (self.end_day - self.start_day).to_i 
     end
 
     def total_kakaku
       total_price = (self.room.price * self.customer * self.total_days).to_i
     end
end
