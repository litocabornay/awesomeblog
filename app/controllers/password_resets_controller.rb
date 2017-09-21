class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)　変更の期限


#パスワード再設定のeditってなに？？
#上のやつは一体なんの目的？？

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    #登録のメルアドを探して小文字へするアクション
    if @user
      #できたら
      
      @user.create_reset_digest
      #トークン作る
      
      @user.send_password_reset_email
      #メール送る
      
      flash[:info] = "変更用リンクを送信しました。"
      #変更用リンクをメルアドに送信しました。
      
      redirect_to root_url
    else
      flash.now[:danger] = "そのメールアドレスは登録されていません"
      render 'new'
    end
  end

  def edit
  end


  def update
    if params[:user][:password].empty?                  # Case (3)　未入力による失敗した場合
      @user.errors.add(:password, "入力してください。")
      render 'edit'
    elsif @user.update_attributes(user_params)          # Case (4)　成功！した場合
      log_in @user
      flash[:success] = "パスワードはリセットされました。"
      redirect_to @user
    else
      render 'edit'                                     # Case (2)　変更に失敗した場合
    end
  end



  private
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end



    def get_user
      @user = User.find_by(email: params[:email])
      #お前、だれ？
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
              #ユーザーが、存在してるし、アクティブなら
        redirect_to root_url
      end
    end
    
    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "このURLは期限切れです。"
        redirect_to new_password_reset_url
      end
    end
    
    
end


