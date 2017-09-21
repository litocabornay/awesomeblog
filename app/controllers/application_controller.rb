# module CurrentScope
#   thread_mattr_accessor :user_permissions
# end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
# before_action :set_permissions

#   def set_permissions
#     user = User.find(params[:user_id])
#     CurrentScope.user_permissions = user.permissions
#   end
  
  
  
# around_filter :apply_scope 
# def apply_scope 
#   Document.where(:user_id => current_user.id).scoping do 
#   yield 
# end 
  
  
  
  
  
  protect_from_forgery with: :exception
  #デフォルト
  
  
    include SessionsHelper
    #applicationで設定することで、
    #SessionsHelperが全部のcontorollerで使える
    #current_user、logged_in?もここに。


  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end

  def admin_user
    if logged_in?
    redirect_to(root_url) unless current_user.admin?
    else
    redirect_to(root_url) 
    end
  end
  





end
