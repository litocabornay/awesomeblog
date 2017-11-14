class BanksController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:edit, :update]


  def edit
    @bank = User.find(params[:id])
  end
  


  
  
  def update
    @bank = User.find(params[:id])
    if @bank.update(bank_params) 
      flash[:success] = "設定されました。"

    else
      flash[:danger] = "未入力項目があります。"

    end
  end
  






  private

  def bank_params
    params.require(:user).permit(:money)
  end


  
  
 
end