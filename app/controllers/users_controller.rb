class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = current_user
     
  end

  def update
    @user = User.find(params[:id])
     
    if @user.update(user_params)
      flash[:notice] = "「#{@user.username}さん」の情報を更新しました"
      redirect_to root_path 
    else
      flash.now[:alert] = "自己紹介文を入力してください"
           render 'index'
    end
  end
end

private
def user_params
  params.require(:user).permit(:username, :shokai, :email, :image, :user_id) 
end
