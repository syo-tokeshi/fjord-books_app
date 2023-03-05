# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :confirm_myself_posted_comment, only: %i[edit update destroy]
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @comments = @commentable.comments
      render_show_commentable
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def confirm_myself_posted_comment
    redirect_to reports_url if @comment.user.id != current_user.id
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def render_show_commentable
    raise 'must implement in sub classes'
  end

  def set_commentable
    raise 'must implement in sub classes'
  end
end
