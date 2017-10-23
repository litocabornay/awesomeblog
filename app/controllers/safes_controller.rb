class SafesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # before_action :correct_user, only: [:index, :show, :new, :create, :edit, :edit, :update]
  before_action :admin_user, only: [:index, :show, :destroy]
  # before_action :set_current_user, only: [:index]
  
# def set_current_user
#     User.current = current_user
# end


  def csv_output
    @safes = Safe.all
    send_data render_to_string, filename: "safes.csv", type: :csv
  end
    
  def csv_output_two
    @safes = Safe.where("status = '在庫中'")
    send_data render_to_string, filename: "safes.csv", type: :csv
  end
    

  # helper_method :sort_column, :sort_direction
  
  
  
def index2
  @safes = Safe.where("type_machine = '本体'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
  # @safe2 = safe.where(:number_of_foundation => safe.number_of_foundation).where(:status => "在庫中")
  # @safe3 = safe.where(:number_of_frame => safe.number_of_frame).where(:status => "在庫中")
end
def index2_2
  @safes = Safe.where("type_machine = 'セル'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
end
def index2_3
  @safes = Safe.where("type_machine = '枠'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
end
def index2_4
  @safes = Safe.where("type_machine = '基盤'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
end
def index2_5
  @safes = Safe.where("machine = 'スロット'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
end
def index
  @safes = Safe.where("machine = 'パチンコ'").where.not("type_machine = '本体'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
end
def index1_2
  @safes = Safe.where("machine = 'スロット'").where.not("type_machine = '本体'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
end

# @sjis = "attr=" + "ＣＲ八代亜紀　心の故郷帰りませんかＫＴＷ【甘デジ】"
# # @sjis = @str.encode "SJIS"
# @utf8 = @sjis.encode("cp932", :invalid => :replace, :undef => :replace)
# require 'kconv'
# @sjis_str.kconv(Kconv::UTF8)

  # @str = "attr=" + "ＣＲ八代亜紀　心の故郷帰りませんかＫＴＷ【甘デジ】"
  # @params = URI.decode_www_form(@str, Encoding::Shift_JIS)
  

# def index1_2
#   @safes = Safe.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
# end
# def index1_3
#   @safes = Safe.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
# end
# def index1_4
#   @safes = Safe.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
# end
# def index1_5
#   @safes = Safe.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
# end

  
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @products.to_csv }
    # end
    # #CSV
    
    

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

  if session[:place] == "本社"
    @place = true
  elsif session[:place] == "菊水"
    @place2 = true
  end
  
  
  
  
  
  if params[:pachinko]
    
    
  @safe = Safe.new(safe_params)
  @safe2 = Safe.new(safe_params)
  @safe3 = Safe.new(safe_params)
  @safe4 = Safe.new(safe_params)
  
                session[:name] = @safe.name
                # session[:staff] = @safe.staff
                # session[:type_machine] = @safe.type_machine
                session[:from] = @safe.from
                session[:price_from] = @safe.price_from
                session[:remarks] = @safe.remarks
                session[:place] = @safe.place
                
                
                flash[:success] = "登録完了"
                
    
                            unless @safe.number.blank?
                                @safe.save
                                    if @safe.number.start_with?("P0") == true
                                    @machine = "パチンコ"
                                    @type_machine = "枠"
                                    elsif @safe.number.start_with?("P1") == true
                                    @machine = "パチンコ"
                                    @type_machine = "セル"
                                    elsif @safe.number.start_with?("P2") == true
                                    @machine = "パチンコ"
                                    @type_machine = "基盤"
                                    else
                                    @machine = "スロット"
                                    end
                                    
                                    # if @safe.type_machine == "本体" or @safe.type_machine == "セル"
                                    #     @machine = "パチンコ"
                                    # elsif @safe.type_machine == "シリンダー有" or @safe.type_machine == "シリンダー無"
                                    #     @machine = "スロット"
                                    # else
                                    #     @machine = ""
                                    # end
                                    
                                    @safe.update(:type_machine => @type_machine)
                                    @safe.update(:machine => @machine)
                                    

                                    
                            end
            
            
                            unless @safe.number_of_frame.blank?
                                @safe2.save
                                if @safe2.number_of_frame.start_with?("P0") == true
                                    @machine2 = "パチンコ"
                                    @type_machine2 = "枠"
                                elsif @safe2.number_of_frame.start_with?("P1") == true
                                    @machine2 = "パチンコ"
                                    @type_machine2 = "セル"
                                elsif @safe2.number_of_frame.start_with?("P2") == true
                                    @machine2 = "パチンコ"
                                    @type_machine2 = "基盤"
                                else
                                    @machine2 = "スロット"
                                end
                                @safe2.update(:type_machine => @type_machine2)
                                @safe2.update(:machine => @machine2)
                                
                            end
                            
                            
                            unless @safe.number_of_foundation.blank?  
                                @safe3.save
                                if @safe3.number_of_foundation.start_with?("P0") == true
                                    @machine3 = "パチンコ"
                                    @type_machine3 = "枠"
                                elsif @safe3.number_of_foundation.start_with?("P1") == true
                                    @machine3 = "パチンコ"
                                    @type_machine3 = "セル"
                                elsif @safe3.number_of_foundation.start_with?("P2") == true
                                    @machine3 = "パチンコ"
                                    @type_machine3 = "基盤"
                                else
                                    @machine3 = "スロット"
                                end
                                @safe3.update(:type_machine => @type_machine3)
                                @safe3.update(:machine => @machine3)
                            end
            
            
            
                            unless ( @safe.number.blank? || @safe.number_of_frame.blank? || @safe.number_of_foundation.blank? )
                                @safe4.save
             
                                    @machine4 = "パチンコ"
                                    @type_machine4 = "本体"
            
                                @safe4.update(:type_machine => @type_machine4)
                                @safe4.update(:machine => @machine4)
                            end
            
            
                redirect_to "/safes/new"

                  

                
                
                
                
  else
                
                
                
                @safeslot = Safe.new(safe_params)
            
                
                
                if session[:place] == "本社"
                  @place = true
                elsif session[:place] == "菊水"
                  @place2 = true
                end
                
                
                if @safeslot.save
                  
                
                session[:name] = @safeslot.name
                session[:from] = @safeslot.from
                session[:price_from] = @safeslot.price_from
                session[:remarks] = @safeslot.remarks
                session[:place] = @safeslot.place
                
                 @machine = "スロット"
                 @type_machine = "なし"
                 @safeslot.update(:type_machine => @type_machine)
                 @safeslot.update(:machine => @machine)
                
                flash[:success] = "登録完了"
            
            
                redirect_to "/"
                else
                  render 'new'
                end
                
  end
  
end











# def editbot
#   @safe = Safe.find(params[:id])
#   @safe1 = Safe.where("number = @safe.number")
#   @safe2 = Safe.where("number_of_frame = @safe.number_of_frame")
#   @safe3 = Safe.where("number_of_foundation = @safe.number_of_foundation")
  
  
# if @safe.type_machine == "本体"
  
#   if @safe.status == "在庫中"
#     @status = "出庫済"
#     @safe.update(:status => @status)
#     @safe1.update(:status => @status)
#     @safe2.update(:status => @status)
#     @safe3.update(:status => @status)
    
#     @staff_two= current_user.name
#     @safe.update(:staff_two => @staff_two)
#     @safe1.update(:staff_two => @staff_two)
#     @safe2.update(:staff_two => @staff_two)
#     @safe3.update(:staff_two => @staff_two)
    
#     flash[:success] = "出庫完了"
#     redirect_to root_url
#   else
#     flash[:danger] = "権限がないか、既に完了したアクションです。"
#     redirect_to root_url
#   end

# else
  
#   if @safe.status == "在庫中"
#     @status = "出庫済"
#     @safe.update(:status => @status)
    
#     @staff_two= current_user.name
#     @safe.update(:staff_two => @staff_two)
  
#     flash[:success] = "出庫完了"
#     redirect_to root_url
#   else
#     flash[:danger] = "権限がないか、既に完了したアクションです。"
#     redirect_to root_url
#   end
  
# end
  
# end




def edit
    @safe = Safe.find(params[:id])
end


def edit2
    @safe = Safe.find(params[:id])
end

def update

@safe = Safe.find(params[:id])
@id2 = @safe.id - 3
@id3 = @safe.id - 2
@id4 = @safe.id - 1
@safe2 = Safe.find(@id2)
@safe3 = Safe.find(@id3)
@safe4 = Safe.find(@id4)


  if params[:edit]
    
    
              
            if @safe.type_machine == "本体"
                if @safe.status && (@safe.status == "在庫中")
                  
                      if @safe.update(safe_params)
                        @safe2.update(safe_params)
                        @safe3.update(safe_params)
                        @safe4.update(safe_params)
                        
                        
                        # @safe.update(:date_of_removal =>  @safe.date_of_removal , :date_of_verification =>  @safe.date_of_verification , :color_of_panel =>  @safe.color_of_panel , :remarks =>  @safe.remarks , :place =>  @safe.place , :photo =>  @safe.photo)
                        # Safe.where(:number => @safe.number).where(:type_machine => "セル").where(:status => "在庫中").update_all(:date_of_removal =>  @safe.date_of_removal , :date_of_verification =>  @safe.date_of_verification , :color_of_panel =>  @safe.color_of_panel , :remarks =>  @safe.remarks , :place =>  @safe.place, :photo =>  @safe.photo)
                        # Safe.where(:number_of_frame => @safe.number_of_frame).where(:type_machine => "枠").where(:status => "在庫中").update_all(:date_of_removal =>  @safe.date_of_removal , :date_of_verification =>  @safe.date_of_verification , :color_of_panel =>  @safe.color_of_panel , :remarks =>  @safe.remarks , :place =>  @safe.place , :photo =>  @safe.photo)
                        # Safe.where(:number_of_foundation => @safe.number_of_foundation).where(:type_machine => "基盤").where(:status => "在庫中").update_all(:date_of_removal =>  @safe.date_of_removal , :date_of_verification =>  @safe.date_of_verification , :color_of_panel =>  @safe.color_of_panel , :remarks =>  @safe.remarks , :place =>  @safe.place , :photo =>  @safe.photo)
                        
                        
                       
              
                        flash[:success] = "編集完了。"
                        redirect_to root_url
                      else
                        flash[:danger] = "未入力項目があります。"
                        redirect_to root_url
                      end
                      
                else
                  flash[:danger] = "権限がないか、既に完了したアクションです。"
                  redirect_to root_url
                end
                
            else  
              
                if @safe.status && (@safe.status == "在庫中")

                  @safe.update(safe_params)
                  
                  flash[:success] = "出庫完了"
                  redirect_to root_url
                else
                  flash[:danger] = "権限がないか、既に完了したアクションです。"
                  redirect_to root_url
                end
                
            end 
    
  else

              if @safe.type_machine == "本体"
                
                if @safe.status && (@safe.status == "在庫中")
              
                  @safe.update(safe_params)
                  
                  Safe.where(:number => @safe.number).where(:type_machine => "セル").where(:status => "在庫中").update_all(safe_params)
                  Safe.where(:number_of_frame => @safe.number_of_frame).where(:type_machine => "枠").where(:status => "在庫中").update_all(safe_params)
                  Safe.where(:number_of_foundation => @safe.number_of_foundation).where(:type_machine => "基盤").where(:status => "在庫中").update_all(safe_params)
              
                  @staff = current_user.name
                  Safe.where(:number => @safe.number).where(:status => "在庫中").update_all(:staff_two => @staff )
                  Safe.where(:number_of_frame => @safe.number_of_frame).where(:status => "在庫中").update_all(:staff_two => @staff )
                  Safe.where(:number_of_foundation => @safe.number_of_foundation).where(:status => "在庫中").update_all(:staff_two => @staff )
                  
                  
                  session[:to] = @safe.to
                  
                  flash[:success] = "出庫完了"
                  redirect_to root_url
                  
                else
                  flash[:danger] = "権限がないか、既に完了したアクションです。"
                  redirect_to root_url
                end
                
              else
              
                if @safe.status && (@safe.status == "在庫中")
                  # if  @who_now == @who_seller
                  
                  
                  @staff = current_user.name
                  @safe.update(:staff_two => @staff )
                  
                  @safe.update(safe_params)
                  
                  session[:to] = @safe.to

                  Safe.where(:number => @safe.number).where(:type_machine => "本体").where(:status => "在庫中").update_all(safe_params)
                  
                  flash[:success] = "出庫完了"
                  redirect_to root_url
                else
                  flash[:danger] = "権限がないか、既に完了したアクションです。"
                  redirect_to root_url
                end
                
              end

  end

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
    
    
  

  
# def rejection
  
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
#   if @safe.status == "one" or @safe.status == "two"
#     if  @who_now == @who_seller
#       @status = "rejection"
#       @safe.update(:status => @status)
#       #DBに入れる！
#         flash[:success] = "希望を却下しました。"
#         redirect_to seller_user_path(current_user) 
#     elsif @who_now == @who_buyer
#       @status = "rejection"
#       @safe.update(:status => @status)
#       #DBに入れる！
#         flash[:success] = "購入を取りやめました。"
#         redirect_to buyer_user_path(current_user) 
#     else
#       @status = "archive"
#       @safe.update(:archive => @status)
#       #DBに入れる！
#       flash[:danger] = "権限がないか、既に完了したアクションです。"
#       redirect_to buyer_user_path(current_user) 
#     end
#   else
#     @status = "archive"
#     @safe.update(:archive => @status)
#     #DBに入れる！
#     flash[:danger] = "権限がないか、既に完了したアクションです。"
#     redirect_to buyer_user_path(current_user) 
#   end
  
# end  

#     #DBに入れたい特定の情報(パッケージ)を作って
      
#     # if @safe.update
#       # flash[:success] = "設定されました。"
#       # #redirect_back_or(buyer_user_path(current_user))]
#       # redirect_to buyer_user_path(current_user) #通常、redirect_to ★url_path
      
#     # else
#     #   flash[:danger] = "未入力項目があります。"
#     #   redirect_back_or(buyer_user_path(current_user))
#     # end
  
  
  
  

 
  
  
  
  
  
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
  
  
  def destroy
    @safe = Safe.find(params[:id])
    @safe.destroy
      redirect_to safes_path
  end


  private
  
  # def flow_params
  #     params.require(:flow).permit(:content, :before_price, :year_date, :month_date, :day_date, :price, :after_price, :staff, :memo, :pass_company, :recieve_company, :company)
  # end 
   
    # send_data render_to_string, filename: "zaiko.csv", type: :csv
   
  def read_shift_jis_encoded_params
    params_shift_jis = URI.decode_www_form(request.body.read, Encoding::Shift_JIS)
    params_shift_jis.each_with_object({}) do |(key, value), result|
      result[key.to_sym] = value.encode(Encoding::UTF_8, invalid: :replace, undef: :replace)
    end
  ensure
    request.body.rewind
  end
   
   
   
  def safe_params
    params.require(:safe).permit(:name, :staff, :staff2, :type_machine, :number, :number_of_frame, :number_slot, :number_of_foundation, :status, :from, :to, :machine, :price_from, :remarks, :photo, :place, :maker, :year_of_manufacture, :month_of_manufacture, :color_of_panel, :date_of_removal, :date_of_verification)
  end

  # def safe_params2
  #   params.require(:safe).permit(:archive, :status)
  # end
  
  
  def sort_column
      Safe.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end


end