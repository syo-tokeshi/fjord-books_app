class Books::CommentsController < CommentsController
  before_action :set_commentable

  private

  def render_book_show
    @book = @commentable
    render 'books/show'
  end

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
