class MakersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :show, :update]
  before_action :correct_user, only:[:index, :edit, :show, :update]
  before_action :admin_user, only: [:index, :edit, :show, :update]
   
   
  def index
    @makers =Maker.paginate(page: params[:page]) 
  end
  
  def new
    @maker = Maker.new
    #@makers =Maker.paginate(page: params[:page]) 
  end
  
  def edit
    @maker = Maker.find(params[:id])
  end
  
  def create
    @maker = Maker.new(maker) #通常、セキュリティ入れる
    #@maker = current_user.makers.build(maker_params)
    
    
    if @maker.save
      #sessionヘルパーで定義したやつ
      redirect_to root_url 
      flash[:success] = "投稿されました。"
    else
       render 'new'
    end
  end
  
  def update
    @maker = Maker.find(params[:id])
    if @maker.update(detail_params) #通常、セキュリティ入れる
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
  def destroy
    @maker = Maker.find(params[:id])
    @maker.destroy
      redirect_to root_url
  end


  private

  def maker_params
    params.require(:maker).permit(:name)
  end
  #後ろの４つ登録していいですよね？


  # Confirms a logged-in user.
  #　log inしてないユーザーが
  #  editページなどのURLにアクセスできなくするため。
  def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
  end
    #アクセス権限可能性①
  
  
  def correct_user
     redirect_to(root_url) unless current_user?(@user)
  end
  
 
end
