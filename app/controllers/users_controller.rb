class UsersController < ApplicationController
  def show
    # 部分テンプレート用
    # @usercurrent = current_user
    @book = Book.new

    # アソシエーション関係記述、特定ユーザの投稿
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 編集成功時フラッシュメッセージ
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @users =User.all
    @book = Book.new
        # 部分テンプレート用
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end


end
