class UsersController < ApplicationController
  def index
    @users = User.order(id: 'DESC').page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end
end