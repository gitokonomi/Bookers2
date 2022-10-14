class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    @book.user_id = current_user.id
    @book.save
    flash[:notice]="successfully"
      # render "books/index"
    # else
      redirect_to books_path
    # end
  end



  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    flash[:notice] = "Book was successfully destroyed."
    redirect_to book_path
  end

  def index
    @books = Book.all
    @book = Book.new

    @user = User.find(params[@user_id])

  end







    private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
