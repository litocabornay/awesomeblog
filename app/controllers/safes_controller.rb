class SafesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :edit, :update]
  # before_action :correct_user, only: [:index, :show, :new, :create, :edit, :edit, :update]
  
  before_action :set_current_user, only: [:index]
  
# def set_current_user
#     User.current = current_user
# end




def index
  # @safes = Safe.all

  # def set_current_user
  #     User.current = current_user
  # end

  #使えない
  #@user = User.find(params[:id])
  
  #使える
  #@users =User.paginate(page: params[:page]) 

  
  # @safes = Safe.one.seller_correct_user
  # @ones = Safe.one
  
# @safe.current_user = current_user

 
  @seller_one_safes = Safe.one.seller_correct_user
  @buyer_one_safes = Safe.one.buyer_correct_user
  @seller_two_safes = Safe.two.seller_correct_user
  @buyer_two_safes = Safe.two.buyer_correct_user
  @seller_three_safes = Safe.three.seller_correct_user
  @buyer_three_safes = Safe.three.buyer_correct_user
  @seller_returner_safes = Safe.returner.seller_correct_user
  @buyer_returner_safes = Safe.returner.buyer_correct_user
  
  store_location

  # one_safes = Safe.find(:all, :conditions => ["status > :status", { :status => 1 }])
  # @one_safes = one_safes.all
end



def show
   @safe = Safe.find(params[:id])
    
end


def new
  @safe = Safe.new
end


def create
 @user = User.new(user_params)
 if @user.save
    flash[:success] = "成功"
    redirect_to root_url
  else
     render 'new'
 end
end






 def edit
   @safe = Safe.find(params[:id])
   @safe_id = @safe.id
   
   @buyer_id = @safe.buyer_id
   @seller_id = @safe.seller_id
   
   
   @sell_id = @safe.sell_id
   
   @buyer = User.find(@buyer_id)
   @seller = User.find(@seller_id)
   @sell = Sell.find(@sell_id)
   
   
    if @safe.status == "one"

      @edit = "edit_one"
      
   @commission_of_price = 1.02
   @place = @safe.confirm_price
   @commission = (@place * @commission_of_price).floor
    
    elsif @safe.status == "two"
    @title = '購入しますか？２'
    elsif @safe.status == "three"
    @title = '購入しますか？３'
    end
    
 end




def update
# @safe = Safe.find(params[:id])

# if @safe.update(safe_params)
#   redirect_to edit_user_path
# else
#   render 'edit'
# end

@safe = Safe.find(params[:id])
@who_now = current_user.id
@who_buyer = @safe.buyer_id
@who_seller = @safe.seller_id
#必要な情報を準備して

if @safe.status == "one"
  if  @who_now == @who_seller
  @status = "two"
  @safe.update(:status => @status)
  @safe.update(safe_params)
  #DBに入れる！
  flash[:success] = "販売許可しました。"
  redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
  else
  flash[:danger] = "権限がないか、既に完了したアクションです。"
  redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
  end
  
elsif @safe.status == "two"
  if  @who_now == @who_buyer
  @status = "two"
  @safe.update(:status => @status)
  #DBに入れる！
  flash[:success] = "販売許可が完了しました。"
  redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
  else
  flash[:danger] = "権限がないか、既に完了したアクションです。"
  redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
  end
  
elsif @safe.status == "three"
  if  @who_now == @who_seller
  @status = "end"
  @safe.update(:status => @status)
  #DBに入れる！
  flash[:success] = "販売許可が完了しました。"
  redirect_to seller_user_path(current_user) #通常、redirect_to ★url_path
  else
  flash[:danger] = "権限がないか、既に完了したアクションです。"
  redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
  end

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
  
  
  
  
  
  
  
  
  
  
  
 def one
    @safe = Safe.find(params[:id])
    @status = "two"
 end

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
  
  
  def safe_params
    params.require(:safe).permit(:archive, :status, :seller_id, :buyer_id, :date_of_arrive, :confirm_price, :limit_of_inspection)
  end
  
  
  
  
  def sort_column
      Safe.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end


end