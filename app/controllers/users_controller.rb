class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:destroy]
#ログインしなくてもできる　new create
#ログインしてるだけでできる　show
#ログインしてて自分のデータだけできる・もしくはアドミンは全てにおいて　edit update
#ログインしててアドミンだけできる　destroy
  
  
  
  # logged_in_user　correct_user　はメソッドで、
  # このページの以下でdefineしてる。
  
  # onlyの後ろのactionをする前に、
  # 前のアクションをする。
  # 実質的に、フィルターとして使える。
  
  # ruby3以前では、 _filter
  
  
  def sellshow
    
  @user = User.find(params[:id])
    
  @seller_one_safes = Safe.one
  @buyer_one_safes = Safe.one
  @seller_two_safes = Safe.two
  @buyer_two_safes = Safe.two
  @seller_three_safes = Safe.three
  @buyer_three_safes = Safe.three
  @seller_returner_safes = Safe.returner
  @buyer_returner_safes = Safe.returner
    
    #　params[:id]　=　DBのprimaryKey
    
    # @microposts = @user.microposts.paginate(page: params[:page])
    # .pagenate - .allも含まれてる
    # つまり、ページネーション付きで今いるページの
    # ユーザーIDのユーザーのマイクロポストを取得

    
  end  

  
  # def show
    
  #   @user = User.find(params[:id])
    
  # @seller_one_safes = Safe.one
  # @buyer_one_safes = Safe.one
  # @seller_two_safes = Safe.two
  # @buyer_two_safes = Safe.two
  # @seller_three_safes = Safe.three
  # @buyer_three_safes = Safe.three
  # @seller_returner_safes = Safe.returner
  # @buyer_returner_safes = Safe.returner
    
  #   #　params[:id]　=　DBのprimaryKey
    
  #   # @microposts = @user.microposts.paginate(page: params[:page])
  #   # .pagenate - .allも含まれてる
  #   # つまり、ページネーション付きで今いるページの
  #   # ユーザーIDのユーザーのマイクロポストを取得

    
  # end
  
  # def bank
  #   @users = User.all
  # end

  def index
    @users = User.all
    
  end
  
  def show
  @user = User.find(params[:id])
  @embedded = "show_user"

  end
  
  

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
    @flow = Flow.new
  
  
    # details = User.test(user_id)
    # @user = details[:user]
    # @flow = details[:flow]
    
  end
  
  # def moneyedit
  #   @user = User.find(params[:id])
  # end  

  
  #ユーザーが登録される時
  def create
    #①DBに情報を入れる準備
    #②DBに情報を入れる
    #③loginする
    #④rememberの動作行う
    #⑤成功のポップアップだす
    #⑥各SHOWページへ進む
    
    @user = User.new(user_params)
    
    
    #　User　=　モデル
    #　.new　=　class(設計図)の情報をobjectにする
    #　→これで、DBに情報入れれる状態にする
    

    #Try1
    # @user.save
    #Try2
   if @user.save

    UserMailer.account_activation(@user).deliver_now
      
    @user.send_activation_email  #SENDGRID
      
    flash[:info] = "Please check your email to activate your account."
    redirect_to root_url

    
    # INSERTと同じ
    #.save →  DBに情報入れた
     

    # UserMailer.account_activation(@user).deliver_now
    # #メールを送る
     
    # #log_in @user
    # #sessionヘルパーで定義したやつ
    
    # #remember @user 

    # flash[:success] = "認証メールを送信いたしました。ご確認ください。"
    # #ポップアップ
     
     
    # redirect_to root_url
    # #前　ー　その情報のところにいく　=SHOWページにいく
    # #メール認証追加後　ー　トップへ飛ぶ設定
     
     
   else
     render 'new'
   end
  end
  
  
  

  
  #　登録後に、そのままloginのため
  # loginする　=　sessionにユーザーIDが入る
  
  
  
  def update
    
    @user = User.find(params[:id])
    @flow = Flow.new(flow_params)
    #必要な情報を準備して
    
    if @flow.save
      
      @money = @flow.after_price
      @money1 = @flow.price
      @price = @user.money
      @money2 = @money1 + @price
      #DBに入れたい特定の情報(パッケージ)を作って
    
      @flow.update(:before_price => @price)
      @flow.update(:after_price => @money2)
      @user.update(:money => @money2)
      #DBに入れる！
      
      flash[:success] = "設定されました。"
      redirect_back_or(edit_user_path(params[:id]))
    else
      flash[:danger] = "未入力項目があります。"
      redirect_back_or(edit_user_path(params[:id]))
    end
    

    
    
  #   @user = User.find(params[:id])
  #   # @flow = Flow.build(flow_params)
    
  #   #1
  #   # @flow.save
    
  # #   #2
  # # respond_to do |format|
  # #     if @user.update(user_params) 
        
  # #       redirect_back_or(edit_user_path(params[:id]))
        
  # #     else
        
  # #       format.html { render action: 'edit' }
       

  # #     end
  # #   end

      
  #   if @user.update(user_params) 
  #     flash[:success] = "設定されました。"
  #     # redirect_to edit_user_path(params[:id])
      
      
  #     redirect_back_or(edit_user_path(params[:id]))
  #     # add
  #     # # @x = @user.bank
  #     # # @y = @user.reccent_deposit
  #     # add(@user.bank,@user.reccent_deposit)
  #     # @user.bank = @add
  #   else
  #     flash[:danger] = "未入力項目があります。"
  #     # redirect_to edit_user_path(params[:id])
  #     redirect_back_or(edit_user_path(params[:id]))
  #   end
    
  end

  # def moneyupdate
  #   @user = User.find(params[:id])
  #   if @user.update(money_params) 
  #     flash[:success] = "設定されました。"
  #     redirect_to moneyedit_user_path(params[:id])
  #   else
  #     flash[:danger] = "未入力項目があります。"
  #     redirect_to moneyedit_user_path(params[:id])
  #   end
  # end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path
  end
  

# ★m = model name(ex.users) =directory name
# ★c = model name(ex.user) =singlar
# ★t = model's class name(ex.User)
# ★url = directory name


#  def ★vote★
#    @★c = ★t.find(params[:id])
#    @★c.votes.creste
#     redirect_to ★url_path
#  end




  # def add
  # @user.bank += @user.reccent_deposit
  # end



  def buyer
    
  @title = "買い｜進行中の案件"
  @embedded = "buy_and_sell"
  @embedded1 = "buy_table1"
  @embedded2 = "buy_table2"
  @embedded3 = "buy_table3"
  @embedded4 = "buy_tablereturn"
  
  @user = User.find(params[:id])
  

   
  @seller_one_safes = Safe.one
  @buyer_one_safes = Safe.one
  @seller_two_safes = Safe.two
  @buyer_two_safes = Safe.two
  @seller_three_safes = Safe.three
  @buyer_three_safes = Safe.three
  @seller_returner_safes = Safe.returner
  @buyer_returner_safes = Safe.returner
    render 'show'
  end

  #Sample Route: /users/32/buyer
  
  def seller
  
  @title = "売り｜進行中の案件"
    
  @embedded = "buy_and_sell"
  @embedded1 = "sell_table1"
  @embedded2 = "sell_table2"
  @embedded3 = "sell_table3"
  @embedded4 = "sell_tablereturn"
  
  @user = User.find(params[:id])
  @seller_one_safes = Safe.one
  @buyer_one_safes = Safe.one
  @seller_two_safes = Safe.two
  @buyer_two_safes = Safe.two
  @seller_three_safes = Safe.three
  @buyer_three_safes = Safe.three
  @seller_returner_safes = Safe.returner
  @buyer_returner_safes = Safe.returner
    render 'show'
  end
  
  
  
#----
#以下、フォロー機能のカスタムフィールドのためです。----
#----
 #Sample Route: /users/32/followers
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  #Sample Route: /users/32/following
  
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  #簡易的な RESTのようなもの
  
  #show_follow.htmlのため

#ルート
# memberの能力
# URLは２つ、ファイルは１つ
# ①コントローラーで飛ぶURLと同じ名前、memberのgetと同じ名前、のmethodを書く、
# ②情報を挙列させると、カスタムポストテンプレートのように、部分的に別の表示をさせることができる
  
  
  
  
  
  

  private

  def user_params
    if logged_in?
      if current_user.admin?
      params.require(:user).permit(:money, :money_yet, :reccent_deposit, :name, :email, :password, :password_confirmation, :company_name, :company_name_sounds, :company_president, :company_president_sound, :company_post_number, :company_place, :company_place_detail, :company_call_number, :company_fax_number, :company_branch, :company_type, :company_union, :company_reception, :company_reception_sound, :company_position, :company_post_number_contact, :company_place_contact, :company_call_number_contact, :company_call_number_contact_name_1, :company_call_number_contact_tel_1, :company_call_number_contact_name_2, :company_call_number_contact_tel_2, :company_call_number_contact_name_3, :company_call_number_contact_tel_3, :company_call_number_contact_name_4, :company_call_number_contact_tel_4, :company_call_number_contact_name_5, :company_call_number_contact_tel_5, :company_call_number_contact_name_6, :company_call_number_contact_tel_6, :company_call_time_from_1, :company_call_time_from_2, :company_call_time_to_1, :company_call_time_to_2, :company_fax_number_contact, :company_call_number_emergency, :company_url, :company_mail_address, :company_place_detail_contact, :company_pr)
      else
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :company_name, :company_name_sounds, :company_president, :company_president_sound, :company_post_number, :company_place, :company_place_detail, :company_call_number, :company_fax_number, :company_branch, :company_type, :company_union, :company_reception, :company_reception_sound, :company_position, :company_post_number_contact, :company_place_contact, :company_call_number_contact, :company_call_number_contact_name_1, :company_call_number_contact_tel_1, :company_call_number_contact_name_2, :company_call_number_contact_tel_2, :company_call_number_contact_name_3, :company_call_number_contact_tel_3, :company_call_number_contact_name_4, :company_call_number_contact_tel_4, :company_call_number_contact_name_5, :company_call_number_contact_tel_5, :company_call_number_contact_name_6, :company_call_number_contact_tel_6, :company_call_time_from_1, :company_call_time_from_2, :company_call_time_to_1, :company_call_time_to_2, :company_fax_number_contact, :company_call_number_emergency, :company_url, :company_mail_address, :company_place_detail_contact, :company_pr)
      end
    else
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :company_name, :company_name_sounds, :company_president, :company_president_sound, :company_post_number, :company_place, :company_place_detail, :company_call_number, :company_fax_number, :company_branch, :company_type, :company_union, :company_reception, :company_reception_sound, :company_position, :company_post_number_contact, :company_place_contact, :company_call_number_contact, :company_call_number_contact_name_1, :company_call_number_contact_tel_1, :company_call_number_contact_name_2, :company_call_number_contact_tel_2, :company_call_number_contact_name_3, :company_call_number_contact_tel_3, :company_call_number_contact_name_4, :company_call_number_contact_tel_4, :company_call_number_contact_name_5, :company_call_number_contact_tel_5, :company_call_number_contact_name_6, :company_call_number_contact_tel_6, :company_call_time_from_1, :company_call_time_from_2, :company_call_time_to_1, :company_call_time_to_2, :company_fax_number_contact, :company_call_number_emergency, :company_url, :company_mail_address, :company_place_detail_contact, :company_pr)
    end
  end
  

   def flow_params
      params.require(:flow).permit(:user_id, :company, :before_price, :year_date, :month_date, :day_date, :price, :after_price, :staff, :memo)
   end

  


  # def money_params
  #   params.require(:user).permit(:money)
  # end


  # Confirms a logged-in user.
  #　log inしてないユーザーが
  #  editページなどのURLにアクセスできなくするため。
  def logged_in_user
     unless logged_in?
     
       store_location
       # 飛び先のURLを要求（GETアクションの時のみ）
       
       # 目的
       # ログインできてなくて、ログインページに弾かれた。
       # その後、ログイン成功した時に、
       # もともと行きたかったページに飛ばしてあげるため。（サービス）
       
       
       
       flash[:danger] = "Please log in."
       
       redirect_to login_url
       # login_url = /login
       #ファルスだと、飛べる
       #loginしてると、希望のページに飛べる
       #つまり、current_userに情報が入ってるか？？
       
       
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
  
 
 
 

  
  
    

  
  
  
 
end