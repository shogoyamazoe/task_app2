class RoomsController < ApplicationController
  
  before_action :authenticate_user!, except: [:search]

  def index
    @rooms = Room.all  
  end

  def new
    @room = Room.new
  end

  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id  
    if @room.save
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def show
    
    @room = Room.find(params[:id])
    #if user_signed_in?
    @user = current_user
    #@room.user_id = current_user.id
    #end
    @postuser = @user.rooms
    @reservation = Reservation.new  
   
  end


  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :rooms
  end
 
  def postuser
   @user = current_user
   @rooms = @user.rooms
  end
  
  private
  def room_params
    params.require(:room).permit(:roomname, :introduction, :price, :address, :roomimg, :user_id, :room_id) 
  end
end
