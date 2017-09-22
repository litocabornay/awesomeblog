class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :help]
  before_action :correct_user, only: [:destroy, :help]
  before_action :admin_user, only: [:destroy, :help, :edit, :index]
  
  
  helper_method :sort_column, :sort_direction
    
    
  # def more
  #   index
  # end
  
  
  def suggestion
    
  end
  
    
  def home
   
    
    #@sells = Sell.all.order(sort_column + ' ' + sort_direction)
    #@users =User.where(all: ort_column + ' ' + sort_direction)   
    @sells = Sell.where("content_type = 'パチンコ'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    #@sells =Sell.paginate(page: params[:page]) 
    
    
    if params[:name].present? 
    @sells = @sells.get_by_name params[:name]
    end
    if params[:maker].present?
    @sells = @sells.get_by_maker params[:maker]
    end
    

    
    #1
    #@micropost = current_user.microposts.build if logged_in?
    #2
    #@micropost = current_user.microposts.build
      
      #ページ左側からポストを作るため。build = new
      #newとbuildの違いは、buildは制限がないものを構築する場合。
      
    #@feed_items = current_user.feed.paginate(page: params[:page])
      # .feed - オリジナルメソッド　in モデル
      #ニュースフィードに表示する情報を引っ張る。
      #見つけるだけ　←フィードをアウトプットするための
      #特定のユーザーのマイクロポストを全部見るける
      # .paginate - レザブドメソッド - これがループの役割！
    

      #.order(sort_column + ' ' + sort_direction)
      
      
  # def index
  #   # 設定
  #   if @sort  == session[:sort]
  #     @direction = session[:direction] == 'asc' ? 'desc' : 'asc'
  #   else
  #     @direction = 'asc'
  #   end
  #   # データ呼び出し
  #   @messages = Message.order(@sort + ' ' + @direction).page(params[:page])
  #   # セッション保存
  #   session[:sort] = @sort
  #   session[:direction] = @direction
 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @messages }
  #   end
  # end
    
    
      #@sells = Sell.order('id ASC').reorder('name DESC')

  end
  
  def slot
    @sells = Sell.where("content_type = 'スロット'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    if params[:name].present? 
    @sells = @sells.get_by_name params[:name]
    end
    if params[:maker].present?
    @sells = @sells.get_by_maker params[:maker]
    end
  end  

  def extra
    @sells = Sell.where("content_type = 'その他'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    if params[:name].present? 
    @sells = @sells.get_by_name params[:name]
    end
    if params[:maker].present?
    @sells = @sells.get_by_maker params[:maker]
    end
  end  

  def about
    @sell = Sell.find(params[:id])
    @details = Detail.all

  
  end

  def help
    #@users =User.all(page: params[:page]) 
    @users =User.paginate(page: params[:page]) 
  end
  
  def edit
    @user = User.find(params[:id])
    @flow = Flow.new
    store_location
  end
  
  # def preedit
  #   @user = User.find(params[:id])
    
  #   # @user = User.find(params[:id])
  #   # store_location
  #   # render :action => 'edit'
  #   # # @flow_items = @user.flowfeed.paginate(page: params[:page])
  # end
  
  
  # def add
  #   Flow.all.before_price.last(1) + Flow.all.price.last(1)
  # end
  
  
  def show
  @user = User.find(params[:id])
  @flow = Flow.new()
  
  # # @flow.after_price = @flow.before_price + @flow.price
  # @flow.save
  end  
  
  
  def confirm
    @flow = Flow.all
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update(flow_params) #通常、セキュリティ入れる
      redirect_to root_url #通常、redirect_to ★url_path
    else
      render 'edit'
    end
  end
  
  
  
  
  def index
    @users =User.paginate(page: params[:page]) 
    
  end
  
  def contact
  end
  

  
  
  private
  

  

  def sell_params
    params.require(:sell).permit(:name, :maker, :number, :status, :place, :type_machine, :price, :removal_date, :remnant, :stage, :condition, :remarks)
  end
  
  def flow_params
      params.require(:flow).permit(:company, :before_price, :year_date, :month_date, :day_date, :price, :after_price, :staff, :memo)
  end
  
 def correct_user
     @sell = current_user.sells.find_by(id:params[:id])
     redirect_to root_url if @sell.nil?
 end
  
  
   
  def sort_column
    Sell.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end



  
end
#————— 
# つまり、テンプレではめれないような独特な動きをするサイトを作りたければ、
# HTMLだけのVCを作って、システム本体のMVCも作って、
# MVCの方でadminなどの制限のほとんどない、
# なんでもありシステム(とりあえずの全体のシステム)を作り、
# その後、一部をVCのコントローラーを使うことで使わせてもらう。
# このVC-MVCシステムが最強。
# サイトマップ的にいうと、基本全部をVCで作るノリで、
# MVCの方でそのままwebページとして成り立っちゃう部分はMVCを使う。