class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    
  end

  def new
    @room = Room.new
  end

  
  def create
    @room = Room.new(room_params)
    binding.pry
    if @room.save

      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :rooms
  end

  private
  def room_params
    params.require(:room).permit(:roomname, :introduction, :price, :address, :roomimg) # 変更後
  end

end
