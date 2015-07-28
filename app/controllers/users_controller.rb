class UsersController < ApplicationController
  
  # 課題4　編集機能の追加
  
  #before_action :user_params, only: [:edit, :update]
  
  def edit
    @user = User.find(params[:id])
  end

  # 課題4　更新機能の追加
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "設定を更新しました。"
      redirect_to @user
    else
      render 'edit' #更新できないなら編集フォームから移動しない
    end
  end
  # 課題4ここまで
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :area, :profile)
  end
  
end
