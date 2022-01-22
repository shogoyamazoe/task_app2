class ReservationsController < ApplicationController
  
  def index
    @user = current_user
    @reservations = @user.reservations   
    @reservations = Reservation.all  
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
      if @reservation.end_day.nil?
           flash.now[:alert] = "開始日・終了日を入力してください"
           render 'rooms/show'
        elsif @reservation.customer.nil?
          flash.now[:alert] = "予約人数を入力してください"
          render 'rooms/show'
        elsif @reservation.end_day < @reservation.start_day
          flash.now[:alert] = "開始日より後日を入力してください"
          render 'rooms/show'
        else
          @reservation.total_days = @reservation.total_yoyaku 
          @reservation.total_price = @reservation.total_kakaku
      end 
      
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

 def back
  @back = Room.find(params[:reservation][:room_id])
  redirect_to room_path(@back)
 end
 
  
  private
    def reservation_params
       params.require(:reservation).permit(:user_id, :start_day, :end_day, :customer, :room_id, :total_days, :total_price)
    end

end

