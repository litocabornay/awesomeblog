class SellsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update]
  # before_action :correct_user, only: [:edit, :update, :delete]

  
  
  
  
  
  helper_method :sort_column, :sort_direction
  #helper使えるように

  def index
    
    @all = "all"
    
    
    if params[:sell]
     @sells = Sell.where(maker: params[:sell][:maker].downcase).order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    elsif params[:name]
     @sells = Sell.where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    else
     @sells = Sell.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end
    store_location





    # if params[:sell]
    #   @sells = Sell.where(maker: params[:sell][:maker].downcase)
    # elsif params[:maker]
    #   #show all
    #   @sells = Sell.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    # end
    # store_location
    
    #@sells =Sell.paginate(page: params[:page]) 
    #@sells = Sell.order(params[:sort] + ': :' + params[:direction])
    #@sells = Sell.order(params[:sort])
    #.orderが並び替え
  end
  
  
  
  
  # def own
  #   @current = current_user.id
    
    
  #   if params[:name]
  #   @sells = Sell.where(user_id: @current).where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  #   else
  #   @sells = Sell.where(user_id: @current).order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  #   end
  #   store_location
    
    
  # end  
  
  
  
  # def home
  # @sell = Sell.find(params[:id])
  # @division = @sell.price / @sell.number
  # @details = Details.all
  # store_location
  # end
  
  def show
    @sell = Sell.find(params[:id])
    
    session.delete(:seller)
    session[:seller] = @sell.id
    
    session.delete(:seller_user)
    session[:seller_user] = @sell.user_id
    
    
    if @sell.content_type == "パチンコ"
      @embeded_place = 'sells/detail'
    elsif @sell.content_type == "スロット"
      @embeded_place = 'sells/detail2'
    elsif @sell.content_type == "その他"
      @embeded_place = 'sells/detail3'
    end
    

    
  end
  




  def new
    @new_one = "new"
    # session[:pachinko] =  "パチンコ"
    # content_type を決める用
    
    # @cylinder = "無し"
    # @pachinko = "パチンコ"
    @sell = Sell.new
    store_location
    session.delete(:pachinko)
    session[:pachinko] = "new"
  end
  
  def slot
    @new_one = "new"
    # session[:pachinko] =  "スロット"
    # content_type を決める用
    
    # @type_machine = "無し"
    # @pachinko = "スロット"
    @sell = Sell.new
    store_location
    session.delete(:pachinko)
    session[:pachinko] = "slot"
  end
  
  def extra
    @new_one = "new"
    # session[:pachinko] =  "その他"
    # content_type を決める用
    
    # @cylinder = "無し"
    # @maker = "無し"
    # @remnant = "無し"
    # @pachinko = "その他"
    @sell = Sell.new
    store_location
    session.delete(:pachinko)
    session[:pachinko] = "extra"
  end
  
  
  
  
  def edit
    @sell = Sell.find(params[:id])
    session[:params] = params[:id]
    store_location
  end
  
  
  def edit_slot
    @sell = Sell.find(params[:id])
    session[:params] = params[:id]
    store_location
  end
  
  
  def edit_extra
    @sell = Sell.find(params[:id])
    session[:params] = params[:id]
    store_location
  end
  
  
  
  
  
  def create
     @sell = Sell.new(sell_params)
     #@sell = Sell.build(sell_params)
     if @sell.save
       
      @sell.update(:user_id => current_user.id)
       
      # session.delete(:pachinko)
       
      # unless @maker.blank?
      #   @maker.update(:maker => @maker)
      # end
       
      # unless @remnant.blank?
      #   @remnant.update(:remnant => @remnant)
      # end
       
      # unless @type_machine.blank?
      #   @type_machine.update(:type_machine => @type_machine)
      # end
       
      # unless @cylinder.blank?
      #   @cylinder.update(:cylinder => @cylinder)
      # end
       
       flash[:success] = "投稿が完了しました！"
       
       if session[:pachinko] == "new"
        redirect_to own_path
        session.delete(:pachinko)
       elsif session[:pachinko] == "slot"
        redirect_to own_slot_path
        session.delete(:pachinko)
       elsif session[:pachinko] == "extra"
        redirect_to own_extra_path
        session.delete(:pachinko)
       end
        
        
        
     else
       @sell = []
       flash[:danger] = "未入力項目があります。"
       redirect_back_or(root_url)

     end
  end





  def update
    @sell = Sell.find(session[:params])
    if @sell.update(sell_params) #通常、セキュリティ入れる
       flash[:success] = "更新に成功しました！"
       session.delete(:fowarding_url)
       redirect_to "/back"
    else
       flash[:danger] = "未入力項目があります。"
       redirect_back_or(root_url)
    end
  end
  
  
  def back
    redirect_back_or(root_path)
  end
  
  
  
  # def destroy
  #   @sell = Sell.find(params[:id])
  #   @sell.destroy
  #     redirect_to root_url
  # end
  
  # def destroy
  #   # @micropost = current_user.micropost.find(params[:id])
  #   # ここに直で書いてしまうとバリデーションが効かない。
    
  #   @sell.destroy
  #   flash[:success] = "投稿は削除されました"
    
  #   # redirect_to users_path
  #   #これだと、ユーザーページでもトップに飛んでしまう。
    
  #   redirect_to request.referrer || root_url
  #   #どのページでもリダイレクトするためのコピペテンプレ。
  #   #request.referrerメソッド
    
  # end
  
  
  # def detail
    
  # #   # @sell = Sell.find(params[:id])
  # #   # @user = User.find(params[:id])
  # #   # @details = User.all

  #   # @sell  = Sell.find(params[:id])
  #   # @sells = @sell.following.paginate(page: params[:page])
  #   # render 'show_follow'
  # end
    

  def make_safe

    @safe = Safe.new
  end
   
   
   

    
    

  private
  
  
  
  def sort_column
    Sell.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end




  # def correct_user
  #   @sell = current_user.sells.find_by(:params[:id])
    
  #   # @sell = Sell.find(params[:id])
    
  #   # if Sell.find(params[:id]).user_id = current_user.id
      
  #   # else
  #   redirect_to root_url if @sell.nil?
  #   # end
    
  # end
 

  def sell_params
    params.require(:sell).permit(:user_id, :content_type, :name, :maker, :number, :cylinder, :status, :place, :type_machine, :price, :removal_date, :remnant, :stage, :condition, :remarks)
  end


  # def safe_params
  #   params.require(:safe).permit(:status, :seller_id, :sell_id, :buyer_id, :date_of_arrive, :confirm_price, :confirm_number, :limit_of_inspection)
  # end



  
  
end