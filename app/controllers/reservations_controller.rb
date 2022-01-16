class ReservationsController < ApplicationController
  def index
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.total_days = @reservation.total_yoyaku 
    @reservation.total_price = @reservation.total_kakaku
    @reservation.user_id = current_user.id
    @reservation.room_id = @room.id
    
    binding.pry

    
  end

  def show
  end
  
  def back
    @reservation = Reservation.new(reservation_params)
    render :new
  end
  
  def confirm
  end
  
 
  
  def create
    @reservation = Reservation.new(reservation_params)
    binding.pry
    @reservation.user_id = current_user.id
    @reservation.room_id = @room.id
    if @reservation.save
    
      redirect_to rooms_path
    else
      render :new   
     end
  end

 
 
  
  private
    def reservation_params
      #params.permit(reservation: {"start_day"=> "start_day"})

      params.require(:reservation).permit(:start_day, :end_day, :customer, :total_days, :total_price)
                     .merge(user_id: current_user.id, room_id: @room.id)
      
      #params.permit(:start_day)
      #params[:reservation].permit(:start_day)
    end

  end


