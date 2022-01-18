class ReservationsController < ApplicationController
  
  def index
    @user = current_user
    @reservations = @user.reservations   
    #@reservations.roomname = @reservation.room.roomname
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.total_days = @reservation.total_yoyaku 
    @reservation.total_price = @reservation.total_kakaku

    
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.room_id = @reservation.room.id
    if @reservation.save
      redirect_to reservations_path
    else
      render :new   
     end
  end

 
 
  
  private
    def reservation_params
       params.require(:reservation).permit(:user_id, :start_day, :end_day, :customer, :room_id, :total_days, :total_price)
    end

end

