class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:id])
    # 編集成功時フラッシュメッセージ
    flash[:notice] = "User was successfully updated."
    # 編集成功時へ
    redirect_to book_path(@book.id)
  end
end
