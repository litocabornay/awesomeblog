class Admin::UsersController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :index, :edit, :show, :update, :destroy]
  # before_action :correct_user, only: [:new, :create, :index, :edit, :show, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :index, :edit, :show, :update, :destroy]
#アドミンだけ、なんでもできる。
  

  def index
    @users =User.paginate(page: params[:page]) 
  end
  
  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
   if @user.save
     flash[:success] = "ユーザーが制作されました。"
     redirect_to "/admin"
   else
     redirect_to "/admin"
   end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes user_params
      flash[:success] = "設定されました。"
      redirect_to admin_edit_user_path(params[:id])
    else
      flash[:danger] = "未入力項目があります。"
      redirect_to admin_edit_user_path(params[:id])
    end
  end
  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to admin_users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :company_name, :company_name_sounds, :company_president, :company_president_sound, :company_post_number, :company_place, :company_place_detail, :company_call_number, :company_fax_number, :company_branch, :company_type, :company_union, :company_reception, :company_reception_sound, :company_position, :company_post_number_contact, :company_place_contact, :company_call_number_contact, :company_call_number_contact_name_1, :company_call_number_contact_tel_1, :company_call_number_contact_name_2, :company_call_number_contact_tel_2, :company_call_number_contact_name_3, :company_call_number_contact_tel_3, :company_call_number_contact_name_4, :company_call_number_contact_tel_4, :company_call_number_contact_name_5, :company_call_number_contact_tel_5, :company_call_number_contact_name_6, :company_call_number_contact_tel_6, :company_call_time_from_1, :company_call_time_from_2, :company_call_time_to_1, :company_call_time_to_2, :company_fax_number_contact, :company_call_number_emergency, :company_url, :company_mail_address, :company_place_detail_contact, :company_pr)
  end


  
  

  
  
  
 
end