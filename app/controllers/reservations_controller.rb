class ReservationsController < ApplicationController
  def index
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.total_days = @reservation.total_days 
    @reservation.total_price = @reservation.total_price
    
    
    
  end
  def back
    @reservation = Reservation.new(reservation_params)
    render :new
  end
  
  def confirm
    
  end
  
  def complete
    Reservation.create(reservation_params)
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      
      redirect_to rooms_path
    else
      render :new   
     end
  end

 
 
  
  private
    def reservation_params
      params.permit(:user_id, :start_day, :end_day, :customer, :room_id, :total_days, :total_price)
      
    end

end

