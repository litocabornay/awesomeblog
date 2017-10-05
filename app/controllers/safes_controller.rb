class SafesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :edit, :update]
  # before_action :correct_user, only: [:index, :show, :new, :create, :edit, :edit, :update]
  before_action :admin_user, only: [:index]
  # before_action :set_current_user, only: [:index]
  
# def set_current_user
#     User.current = current_user
# end


  # helper_method :sort_column, :sort_direction
def index2
  @safes = Safe.where("status = '在庫中'").paginate(page: params[:page])
end
  
  
def index
  @safes = Safe.paginate(page: params[:page])

  # @seller = User.find(@safe.seller_id)
  # @buyer = User.find(@safe.buyer_id)
  
  
  # @seller = Safe.seller_id
  # @buyer = Safe.buyer_id
  # @sell =  Safe.sell_id
  
  # @seller = User.find(@seller)
  # @buyer = User.find(@buyer)
  # @sell = Sell.find(@sell)

  # def set_current_user
  #     User.current = current_user
  # end


  
  # @safes = Safe.one.seller_correct_user
  # @ones = Safe.one
  
# @safe.current_user = current_user

  # @seller_one_safes = Safe.one
  # @buyer_one_safes = Safe.one
  # @seller_two_safes = Safe.two
  # @buyer_two_safes = Safe.two
  # @seller_three_safes = Safe.three
  # @buyer_three_safes = Safe.three
  # @seller_returner_safes = Safe.returner
  # @buyer_returner_safes = Safe.returner
   
   
  # @seller_one_safes = Safe.one
  # @buyer_one_safes = Safe.one
  # @seller_two_safes = Safe.two
  # @buyer_two_safes = Safe.two
  # @seller_three_safes = Safe.three
  # @buyer_three_safes = Safe.three
  # @seller_returner_safes = Safe.returner
  # @buyer_returner_safes = Safe.returner
  
  # store_location

  # one_safes = Safe.find(:all, :conditions => ["status > :status", { :status => 1 }])
  # @one_safes = one_safes.all
end

  
 def safe
   
    if params[:number]
     @safes = Safe.where("status = '在庫中'").where(number: params[:number]).paginate(page: params[:page])
    else
     @safes = Safe.where("status = '在庫中'").paginate(page: params[:page])
    end
    
 end
 
 
 def after

  # @safe = Safe.where(:number => params[:number])
  
    if params[:number]
    @safes = Safe.where("status = '在庫中'").where(number: params[:number]).paginate(page: params[:page])
    else
    @safes = Safe.where("status = '在庫中'").paginate(page: params[:page])
    end

    
 end
 
 

def show
   @safe = Safe.find(params[:id])
    
end


def new
  @safe = Safe.new
  
  # session.delete(:name)
  # session.delete(:staff)
  # session.delete(:type_machine)
  
end


def create

 
    @safe = Safe.new(safe_params)
    
    
    if @safe.save
      
    session[:name] = @safe.name
    session[:staff] = @safe.staff
    session[:type_machine] = @safe.type_machine
    session[:from] = @safe.from
    session[:price_from] = @safe.price_from
    session[:remarks] = @safe.remarks
    
    
    if @safe.type_machine == "本体" or @safe.type_machine == "セル"
        @machine = "パチンコ"
    elsif @safe.type_machine == "シリンダー有" or @safe.type_machine == "シリンダー無"
        @machine = "スロット"
    else
        @machine = ""
    end

    @safe.update(:machine => @machine)
    
    flash[:success] = "登録完了"

    redirect_to "/"
    else
      render 'new'
    end
    

  
  
end


def editbot
  @safe = Safe.find(params[:id])
   
  if @safe.status == "在庫中"

    @status = "出庫済"
    @safe.update(:status => @status)
    
    @staff_two= current_user.name
    @safe.update(:staff_two => @staff_two)
  
    flash[:success] = "出庫完了"
    redirect_to root_url
    
  else
    
    flash[:danger] = "権限がないか、既に完了したアクションです。"
    redirect_to root_url
    
  end
  
end




def edit
    @safe = Safe.find(params[:id])
end




def update

@safe = Safe.find(params[:id])


  if @safe.status && (@safe.status == "在庫中")
    # if  @who_now == @who_seller
    
    @staff = current_user.name
    @safe.update(:staff_two => @staff )
    
    @safe.update(safe_params)
    
    flash[:success] = "出庫完了"
    redirect_to root_url
  else
    flash[:danger] = "権限がないか、既に完了したアクションです。"
    redirect_to root_url
  end
  
  
  
  
# @safe_id = @safe.id

# @buyer_id = @safe.buyer_id
# @seller_id = @safe.seller_id
# @sell_id = @safe.sell_id

# @buyer = User.find(@buyer_id)
# @seller = User.find(@seller_id)
# @sell = Sell.find(@sell_id)

# @commission_of_price = 1.02
# @pricee = @safe.confirm_price
# @commission = (@pricee * @commission_of_price).floor


# @who_now = current_user.id
# @who_buyer = @safe.buyer_id
# @who_seller = @safe.seller_id
# #必要な情報を準備して

# @flow = Flow.new(flow_params)



# if @safe.status == "one"
  

  
  
  
  # else
  # flash[:danger] = "権限がないか、既に完了したアクションです。"
  # redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
  # end
  
  
# elsif @safe.status == "two"

#   if @safe.status == "two"
#     if  @who_now == @who_buyer
#     @status = "three"
#     @safe.update(:status => @status)
#     #DBに入れる！
    
#     @user = User.find(current_user)
    
#     @company = User.find(@who_buyer).company_name
#     @pass_company =User.find(@who_buyer).company_name
#     @recieve_company = User.find(@who_seller).company_name
#     @before_price = User.find(@who_buyer).money
#     # @year_date = "-"
#     # @month_date = "-"
#     # @day_date = "-"
#     @price =  @commission * -1
#     @after_price =  User.find(@who_buyer).money - @commission
#     # @staff = "なし"
#     # @memo = "なし"
#     @content = "buyer購入お金支払い"
#     @flow = Flow.new(:company => @company, :pass_company => @pass_company, :recieve_company => @recieve_company, :before_price => @before_price, :year_date => @year_date, :month_date => @month_date, :day_date => @day_date, :price => @price, :after_price => @after_price, :staff => @staff, :memo => @memo, :content => @content)
#     @flow.save
    
#     @user.update(:money => @after_price)
    
    

#     flash[:success] = "購入が完了しました。"
#     redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
#     else
#     flash[:danger] = "権限がないか、既に完了したアクションです。"
#     redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
#     end
#   else
#   flash[:danger] = "権限がないか、既に完了したアクションです。"
#   redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
#   end 
  
  
# elsif @safe.status == "three"

#   if @safe.status == "three"
#     if  @who_now == @who_buyer
#     @status = "end"
#     @safe.update(:status => @status)
#     #DBに入れる！
  
#     @user = @seller
    
#     @company = User.find(@who_seller).company_name
#     @pass_company = User.find(@who_buyer).company_name
#     @recieve_company = User.find(@who_seller).company_name
#     @before_price = User.find(@who_seller).money
#     # @year_date = "-"
#     # @month_date = "-"
#     # @day_date = "-"
#     @after_price =  User.find(@who_seller).money + @pricee
#     @price =  @pricee
#     # @staff = "なし"
#     # @memo = "なし"
#     @content = "seller代金受け取り"
#     @flow = Flow.new(:company => @company, :pass_company => @pass_company, :recieve_company => @recieve_company, :before_price => @before_price, :year_date => @year_date, :month_date => @month_date, :day_date => @day_date, :price => @price, :after_price => @after_price, :staff => @staff, :memo => @memo, :content => @content)
#     @flow.save
    
#     @user.update(:money => @after_price)
    
#     flash[:success] = "検品合格処理が完了し、取引が無事に終了しました。"
#     redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
    
#     else
      
#     flash[:danger] = "権限がないか、既に完了したアクションです。"
#     redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
#     end
#   else
    
#   flash[:danger] = "権限がないか、既に完了したアクションです。"
#   redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
#   end
    
    
    
# elsif @safe.status == "return"

#   if @safe.status == "return"
#     if  @who_now == @who_seller
#     @status = "return_end"
#     @safe.update(:status => @status)
#     #DBに入れる！
  
#     @user = @buyer
    
#     @company = User.find(@who_buyer).company_name
#     @recieve_company = User.find(@who_buyer).company_name
#     @pass_company = User.find(@who_seller).company_name
    
#     @before_price = User.find(@who_buyer).money
#     # @year_date = "-"
#     # @month_date = "-"
#     # @day_date = "-"
#     @after_price =  User.find(@who_buyer).money + @commission
#     @price =  @commission
#     # @staff = "なし"
#     # @memo = "なし"
#     @content = "seller返金受け取り"
#     @flow = Flow.new(:company => @company, :pass_company => @pass_company, :recieve_company => @recieve_company, :before_price => @before_price, :year_date => @year_date, :month_date => @month_date, :day_date => @day_date, :price => @price, :after_price => @after_price, :staff => @staff, :memo => @memo, :content => @content)
#     @flow.save
    
#     @user.update(:money => @after_price)
    
#     flash[:success] = "返品処理が完了し、取引が無事に終了しました。"
#     redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
    
#     else
      
#     flash[:danger] = "権限がないか、既に完了したアクションです。"
#     redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
#     end
#   else
    
#   flash[:danger] = "権限がないか、既に完了したアクションです。"
#   redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
#   end
  
  
# end
# end
  
  
# def returnback
  
# @safe = Safe.find(params[:id])
# @safe_id = @safe.id

# @buyer_id = @safe.buyer_id
# @seller_id = @safe.seller_id
# @sell_id = @safe.sell_id

# @buyer = User.find(@buyer_id)
# @seller = User.find(@seller_id)
# @sell = Sell.find(@sell_id)

# @commission_of_price = 1.02
# @pricee = @safe.confirm_price
# @commission = (@pricee * @commission_of_price).floor


# @who_now = current_user.id
# @who_buyer = @safe.buyer_id
# @who_seller = @safe.seller_id
# #必要な情報を準備して

# #必要な情報を準備して
#   if @safe.status == "three"
#     if  @who_now == @who_buyer
#       @status = "return"
  
#       @safe.update(:status => @status)
#       #DBに入れる！
#       flash[:success] = "返品処理しました。商品返品前の、販売会社様への連絡をお勧めします。"
#       redirect_to buyer_user_path(current_user) 
#     else
#       @status = "archive"
#       @safe.update(:archive => @status)
#       #DBに入れる！
#       flash[:danger] = "権限がないか、既に完了したアクションです。"
#       redirect_to seller_user_path(current_user)
#     end
#   else
#     @status = "archive"
#     @safe.update(:archive => @status)
#     #DBに入れる！
#     flash[:danger] = "権限がないか、既に完了したアクションです。"
#     redirect_to seller_user_path(current_user)
#   end 
    
    
  
end  
  
def rejection
  
@safe = Safe.find(params[:id])
@safe_id = @safe.id

@buyer_id = @safe.buyer_id
@seller_id = @safe.seller_id
@sell_id = @safe.sell_id

@buyer = User.find(@buyer_id)
@seller = User.find(@seller_id)
@sell = Sell.find(@sell_id)

@commission_of_price = 1.02
@pricee = @safe.confirm_price
@commission = (@pricee * @commission_of_price).floor


@who_now = current_user.id
@who_buyer = @safe.buyer_id
@who_seller = @safe.seller_id

#必要な情報を準備して
  if @safe.status == "one" or @safe.status == "two"
    if  @who_now == @who_seller
      @status = "rejection"
      @safe.update(:status => @status)
      #DBに入れる！
        flash[:success] = "希望を却下しました。"
        redirect_to seller_user_path(current_user) 
    elsif @who_now == @who_buyer
      @status = "rejection"
      @safe.update(:status => @status)
      #DBに入れる！
        flash[:success] = "購入を取りやめました。"
        redirect_to buyer_user_path(current_user) 
    else
      @status = "archive"
      @safe.update(:archive => @status)
      #DBに入れる！
      flash[:danger] = "権限がないか、既に完了したアクションです。"
      redirect_to buyer_user_path(current_user) 
    end
  else
    @status = "archive"
    @safe.update(:archive => @status)
    #DBに入れる！
    flash[:danger] = "権限がないか、既に完了したアクションです。"
    redirect_to buyer_user_path(current_user) 
  end
  
end  

    #DBに入れたい特定の情報(パッケージ)を作って
      
    # if @safe.update
      # flash[:success] = "設定されました。"
      # #redirect_back_or(buyer_user_path(current_user))]
      # redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
      
    # else
    #   flash[:danger] = "未入力項目があります。"
    #   redirect_back_or(buyer_user_path(current_user))
    # end
  
  
  
  

 
  
  
  
  
  
# def one
#     @safe = Safe.find(params[:id])
#     @status = "two"
# end

  #Sample Route: /users/32/one/edit
  
  
  
  
  
  
  
  
  
  

  # around_action :set_current_user
  
  # def set_current_user
  #   Current.user = current_user
  #   yield
  # ensure
  #   # to address the thread variable leak issues in Puma/Thin webserver
  #   Current.user = nil
  # end 
  
  
  


  private
  
  # def flow_params
  #     params.require(:flow).permit(:content, :before_price, :year_date, :month_date, :day_date, :price, :after_price, :staff, :memo, :pass_company, :recieve_company, :company)
  # end 
   
   
  def safe_params
    params.require(:safe).permit(:name, :staff, :staff2, :type_machine, :number, :status, :from, :to, :machine, :price_from, :remarks, :photo)
  end
  
  # def safe_params2
  #   params.require(:safe).permit(:archive, :status)
  # end
  
  
  # def sort_column
  #     Safe.column_names.include?(params[:sort]) ? params[:sort] : "name"
  # end
  
  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  # end


end