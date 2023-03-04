# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show followings followers]
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @following_user = current_user.active_relationships.find_by(followed: @user)
  end

  def followings
    @users = @user.followings.order(:id)
    render 'user_relationships'
  end

  def followers
    @title = t('views.follow.show_follow.followers')
    @users = @user.followers.order(:id)
    render 'user_relationships'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
