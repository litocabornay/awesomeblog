class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  # logged_in_userアクションメソッドを定義してるのは、userコントローラーだが、
  # userコントローラーを使うページ内では、定義してないmicropostaコントローラーでも使える。
  # :create :destroyが、logged_in_user(ログインしてる時)のみ使える。
  
   before_action :correct_user, only: :destroy
   #ダブルバリデーション　（logged_in_userでcorrect_userでないと削除不可）
   #カレントユーザーかの確認。
   
   
   
    
def create
    #①DBに情報を入れる準備
    #②DBに情報を入れる
    #③loginする
    #④rememberの動作行う
    #⑤成功のポップアップだす
    #⑥各SHOWページへ進む
    
    @micropost = current_user.microposts.build(micropost_params)

    #　.build　=　class(設計図)の情報をobjectにする
    #　→これで、DBに情報入れれる状態にする
    
    # .buildは.newと同じ動作をするが、DB上で子供であるmicropostsを使うため、.buildを使う
    


   if @micropost.save
     # INSERTと同じ
    #　.save →  DBに情報入れた
     


     flash[:success] = "flash success!"
    #ポップアップ
     
     
     redirect_to root_url
    #root_urlは、HOMEPAGE
     
     
     
   else
    
    # @feed_items = current_user.feed.paginate(page: params[:page])
     @feed_items = []
    #ここに何かしらのデータがないとバグる
    #トップ画面で、何かしらの

     render 'static_pages/home'
   end
   
   #redirect_to root_url
   #成功、失敗関係なく、root_urlに飛ぶ。
   
end
  
  #　登録後に、そのままloginのため
  # loginする　=　sessionにユーザーIDが入る
  
    
def destroy
    # @micropost = current_user.micropost.find(params[:id])
    # ここに直で書いてしまうとバリデーションが効かない。
    
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    
    # redirect_to users_path
    #これだと、ユーザーページでもトップに飛んでしまう。
    
    redirect_to request.referrer || root_url
    #どのページでもリダイレクトするためのコピペテンプレ。
    #request.referrerメソッド
    
end

private

 def micropost_params
     params.require(:micropost).permit(:content, :picture)
     #contentとpictureを許可
 end

 def correct_user
     @micropost = current_user.microposts.find_by(id:params[:id])
     redirect_to root_url if @micropost.nil?
 end
 
 
end