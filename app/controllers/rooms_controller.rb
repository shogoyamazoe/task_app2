class RoomsController < ApplicationController
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
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = current_user
    @room.user_id = current_user.id
    @postuser = @room.user
    
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
    params.require(:room).permit(:roomname, :introduction, :price, :address, :roomimg, :user_id, :room_id) # 変更後
  end

  

end
