class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      # flash.now[:alert] = "グループ名を入力してください"
      render :index, {book: @book , user: @user}
    end

  end



  def show
    # 部分テンプレート用
    @booknew = Book.new

    @book = Book.find(params[:id])
    @user = @book.user


  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    flash[:alert] = "Book was successfully destroyed."
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book.new

    # 部分テンプレート用
    @user = current_user

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

    private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
