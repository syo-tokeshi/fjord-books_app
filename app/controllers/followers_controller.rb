class Users::FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers.order(id: :desc)
  end
end
