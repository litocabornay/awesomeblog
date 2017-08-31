class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :edit, :show, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  # logged_in_user　correct_user　はメソッドで、
  # このページの以下でdefineしてる。
  
  # onlyの後ろのactionをする前に、
  # 前のアクションをする。
  # 実質的に、フィルターとして使える。
  
  # ruby3以前では、 _filter
  
  
  
  
  
  def index
    # @users = User.all
    #　.all = 元々ある情報を全部取ってくる
    
    # ↓
    
    @users =User.paginate(page: params[:page]) 
    # .pagenate - .allも含まれてる
    
  end
  
  def show
    
    @user = User.find(params[:id])
    #　params[:id]　=　DBのprimaryKey
    
    @microposts = @user.microposts.paginate(page: params[:page])
    # .pagenate - .allも含まれてる
    # つまり、ページネーション付きで今いるページの
    # ユーザーIDのユーザーのマイクロポストを取得

    
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
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
     # INSERTと同じ
    #　.save →  DBに情報入れた
     
     
     
    log_in @user
    #sessionヘルパーで定義したやつ
    
    remember @user 

     flash[:success] = "Welcome to the Awesome Blog App!"
    #ポップアップ
     
     
     redirect_to @user
    #その情報のところにいく　=SHOWページにいく
     
     
     
   else
     render 'new'
   end
  end
  
  #　登録後に、そのままloginのため
  # loginする　=　sessionにユーザーIDが入る
  
  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      redirect_to users_path 
    else
      render 'edit'
    end
  end
  
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







  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  #後ろの４つ登録していいですよね？

  
  
  
  
  
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
     @user = User.find(params[:id])
     
     #redirect_to(root_url) unless @user == current_user
     redirect_to(root_url) unless current_user?(@user)
  end
    #アクセス権限可能性②
  
 
 
 
 
 
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
  
  
  
  
  
 
end
