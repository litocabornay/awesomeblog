class SessionsController < ApplicationController
  

  
  
  def new
  end
  
  
  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  # #   #該当するemail探す　→variableに入れる
  # #   #find_byでモデルとやりとり
  
  #   if user && user.authenticate(params[:session][:password])
  # #   #その"該当するemail"って、、
  # #   #ユーザーが存在する？
  # #   #パスワードあってる？
  # #   #sessionのパスと、DBのパスは同じ？
  # #   #(authenticate- モデルのhas_secure_passwordがあるから使える)
  # #   #つまり、フォームに入れた情報大丈夫？ってこと。
  
  
  #       log_in user
  # #         #　セッションヘルパーの、log_in(user)を使ってる
  # #         # ここで、いわゆる"ログインした"って状態になって。。
  
  
  
  #       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  #       redirect_to user
        
  #       # redirect_back_or user
  #     # else
  #       # message = "Account not activated."
  #       # message += "Check your email for the activation link."
  #       # flash[:warning] = message
  #       redirect_to root_url
  #     # end
  #   else
  #     # Create an error message.
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end
  
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #該当するemail探す　→variableに入れる
    #find_byでモデルとやりとり
    
    if user && user.authenticate(params[:session][:password])
    #その"該当するemail"って、、
    #ユーザーが存在する？
    #パスワードあってる？
    #sessionのパスと、DBのパスは同じ？
    #(authenticate- モデルのhas_secure_passwordがあるから使える)
    #つまり、フォームに入れた情報大丈夫？ってこと。
        if user.activated?
        #すでに有効アカウント？
          log_in user
          #　セッションヘルパーの、log_in(user)を使ってる
          # ここで、いわゆる"ログインした"って状態になって。。
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          #そのセッションにリメンバーはある？チェックした？
          #before
          #redirect_to user
          #showページに飛ぶ
          #↓↓↓↓↓↓↓
          #after
          redirect_back_or user
          #redirect_to root_url
          #元々行きたかった場所に飛ぶ。なければdefaultはshowページ
        else
          #まだ有効なアカウントではない。
          #create an error message.
          message  = "Account not activated. "
          message += "アカウント認証のメールを確認してください。"
          #だからメール認証してくれというメッセージ
            
          flash[:warning] = message
          redirect_to root_url
          #メッセージ流しつつトップへ戻す。
        end
    else
    #そもそも入力情報が大丈夫でない
      flash.now[:danger] = 'メールアドレスかパスワードが間違っています。'
      #入力内容確認してください。
      render 'new'
      #リダイレクト
    end
  end
  
  
  
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  
  # def remember
  #   #①　for rememberボックス　　トークンTO database
  #   #1. Create token  
  #   self.remember_token = User.new_token   
    
  #   #2. Check model/user.rb for (def User.new_token)
  #   #今、remember_token(action)を作った　←token(ランダム文字列)入れた
  #   #self使うのは、Userの情報だから
  
  #   #Mispelling Error
  #   #update_attribute(:remember_digest, User.digset(remember_token))
    
  #   update_attribute(:remember_digest, User.digest(remember_token))
  #   # ":remember_digest"(DBの中のカラム)　に、"User.digest(remember_token)"（暗号化されたランダム文字列）を入れる。
  #   # "attribute = カラム
  #   # digest - 暗号化
  #   # モデルで作った、self.digest(string)を使って暗号化
    
    
  # end
  
  
  
end

