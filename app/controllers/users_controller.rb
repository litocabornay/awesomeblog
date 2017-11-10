class UsersController < ApplicationController
before_action :admin_user
 


  def index
    @users = User.paginate(page: params[:page]) 
  end
  

  
  def new
    @user = User.new
  end
  


  def create
    @user = User.new(user_params)
   if @user.save
      flash[:success] = "成功！"
    redirect_to root_url
   else
     render 'new'
   end
  end
  
  
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "設定されました。"
      redirect_to "/users/"
    else
      flash[:danger] = "未入力項目があります。"
      redirect_to "/users/"
    end
    
  end  

  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path
  end
  
  

  private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :activated)
     
  end
  
  
  def logged_in_user
     unless logged_in?
     
       store_location
 
       
       flash[:danger] = "ログインしてください"
       
       redirect_to login_url

     end
  end
    #アクセス権限可能性①
  
  
  # Confirms the correct user.
  def correct_user
    
    if current_user.admin.nil?
      
     @user = User.find(params[:id])
     #redirect_to(root_url) unless @user == current_user
     redirect_to(root_url) unless current_user?(@user)

    end
    
  end
    #アクセス権限可能性②
  
 def super_admin

   @user = User.find(params[:id])
   if @user.admin == "1"
    flash[:danger] = "working"
  end
 end

end