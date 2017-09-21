class Admin::DepositsController < ApplicationController

# before_action :logged_in_user, only: [:edit, :update]
# before_action :correct_user, only: [:edit, :update]
# before_action :admin_user, only: [:edit, :update]
#アドミンだけ、なんでもできる。
  
  
  def index
    @users = User.all.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      flash[:success] = "設定されました。"
      redirect_to "/admin/deposit/"
    else
      flash[:danger] = "未入力項目があります。"
      redirect_to "/admin/deposit/"
    end
  end
  
  
  
  
  private

  def user_params
    params.require(:user).permit(:money)
  end

  def sort_column
    Sell.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  
  
  # # Confirms the correct user.
  # def correct_user
  #   @user = User.find(params[:id])
     
  #   #redirect_to(root_url) unless @user == current_user
  #   redirect_to("/") unless current_user?(@user)
  # end
  #   #アクセス権限可能性②
  
 
  
end
