class Reports::CommentsController < CommentsController
  before_action :set_commentable

  private

  def render_show_commentable
    @report = @commentable
    render 'reports/show'
  end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
