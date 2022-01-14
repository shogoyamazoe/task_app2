class TopsController < ApplicationController
  before_action :sign_in_required, only: [:index]

  def index
  @user  = current_user
  end

  def show
  end
end
