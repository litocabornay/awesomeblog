class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :help]
  before_action :correct_user, only: [:destroy, :help]
  before_action :admin_user, only: [:destroy, :help, :edit, :index]
  
  
  helper_method :sort_column, :sort_direction
    

    
  def home
   

  end
  

  
end