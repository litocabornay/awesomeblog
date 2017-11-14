class Bank::UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: [:edit, :update]
#アドミンだけ、なんでもできる。
  

  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    #if @user.update_attributes user_params
    if @user.update(user_params) 
      flash[:success] = "設定されました。"
      redirect_to root_url
    else
      flash[:danger] = "未入力項目があります。"
      redirect_to root_url
    end
  end
  
  
  
  
  private

  def user_params
    params.require(:user).permit(:money)
  end

  
  
  
  # Confirms the correct user.
  def correct_user
     @user = User.find(params[:id])
     
     #redirect_to(root_url) unless @user == current_user
     redirect_to(root_url) unless current_user?(@user)
  end
    #アクセス権限可能性②
  
 
  
 
end
