class UserRelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(@user)
    redirect_to user_path(@user), notice: t('controllers.common.notice_create', name: UserRelationship.model_name.human)
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to user_path(@user), notice: t('controllers.common.notice_destroy', name: UserRelationship.model_name.human)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
