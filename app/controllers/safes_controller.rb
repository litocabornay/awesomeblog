class SafesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy, :csv_output_two, :csv_output_three, :csv_output_four, :csv_output_five, :csv_output_six, :csv_output, :csv_output_seven, :index2, :index2_2, :index2_3, :index2_4, :index2_5, :index1_2, :safe, :after, :edit2]
  # before_action :correct_user, only: [:index, :show, :new, :create, :edit, :edit, :update]
  before_action :admin_user, only: [:index, :show, :destroy, :csv_output_two, :csv_output_three, :csv_output_four, :csv_output_five, :csv_output_six, :csv_output, :csv_output_seven, :index2, :index2_2, :index2_3, :index2_4, :index2_5, :index1_2, :edit2]
  # before_action :set_current_user, only: [:index]
  


  helper_method :sort_column, :sort_direction

    
    
    #本体
  def csv_output_two
    @safes = Safe.where("type_machine = '本体'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "在庫_パチンコ_本体(３点セット).csv", type: :csv
    

    
  end
  
  
  
  
  
  
  
    #セル
  def csv_output_three
    @safes = Safe.where("type_machine = 'セル'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "在庫_パチンコ_セルのみ.csv", type: :csv
  end
  
    #枠
  def csv_output_four
    @safes = Safe.where("type_machine = '枠'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "在庫_パチンコ_枠のみ.csv", type: :csv
  end
  
  #   #基盤
  # def csv_output_five
  #   @safes = Safe.where("type_machine = '基盤'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction)
  #   send_data render_to_string, filename: "在庫_パチンコ_基盤のみ.csv", type: :csv
  # end

    #スロット
  def csv_output_six
    @safes = Safe.where("machine = 'スロット'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "在庫_スロット.csv", type: :csv
  end
  
    #履歴パチンコ
  def csv_output
    @safes = Safe.where("machine = 'パチンコ'").where.not("type_machine = '基盤'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "履歴_パチンコ.csv", type: :csv
  end
  
    #履歴スロット
  def csv_output_seven
    @safes = Safe.where("machine = 'スロット'").where.not("type_machine = '基盤'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "履歴_スロット.csv", type: :csv
  end
  
  
  
  # helper_method :sort_column, :sort_direction
  
  
  
def index2

    if params[:maker]
     @safes = Safe.where("type_machine = '本体'").where("status = '在庫中'").where("maker like ?", "%#{ params[:maker]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    elsif params[:name]
      @safes = Safe.where("type_machine = '本体'").where("status = '在庫中'").where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    else
     @safes = Safe.where("type_machine = '本体'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end

  
end
def index2_2
  
  
    if params[:maker]
     @safes = Safe.where("type_machine = 'セル'").where("status = '在庫中'").where("maker like ?", "%#{ params[:maker]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    elsif params[:name]
      @safes = Safe.where("type_machine = 'セル'").where("status = '在庫中'").where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    else
     @safes = Safe.where("type_machine = 'セル'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end
  
end



def index2_3
    if params[:maker]
     @safes = Safe.where("type_machine = '枠'").where("status = '在庫中'").where("maker like ?", "%#{ params[:maker]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    elsif params[:name]
      @safes = Safe.where("type_machine = '枠'").where("status = '在庫中'").where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    else
     @safes = Safe.where("type_machine = '枠'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end
end



# def index2_4
#     if params[:maker]
#      @safes = Safe.where("type_machine = '基盤'").where("status = '在庫中'").where("maker like ?", "%#{ params[:maker]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
#     elsif params[:name]
#       @safes = Safe.where("type_machine = '基盤'").where("status = '在庫中'").where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
#     else
#      @safes = Safe.where("type_machine = '基盤'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
#     end
# end


def index2_5
  # なし
  # スロット
    if params[:maker]
     @safes = Safe.where("type_machine = 'なし'").where("status = '在庫中'").where("maker like ?", "%#{ params[:maker]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    elsif params[:name]
      @safes = Safe.where("type_machine = 'なし'").where("status = '在庫中'").where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    else
     @safes = Safe.where("type_machine = 'なし'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end
end



def index

    if params[:maker]
     @safes = Safe.where("machine = 'パチンコ'").where.not("type_machine = '基盤'").where("maker like ?", "%#{ params[:maker]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    elsif params[:name]
      @safes = Safe.where("machine = 'パチンコ'").where.not("type_machine = '基盤'").where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    else
     @safes = Safe.where("machine = 'パチンコ'").where.not("type_machine = '基盤'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end

end
def index1_2
 
    if params[:maker]
     @safes = Safe.where("machine = 'スロット'").where.not("type_machine = '基盤'").where("maker like ?", "%#{ params[:maker]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    elsif params[:name]
      @safes = Safe.where("machine = 'スロット'").where.not("type_machine = '基盤'").where("name like ?", "%#{ params[:name]}%").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    else
     @safes = Safe.where("machine = 'スロット'").where.not("type_machine = '基盤'").order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    end

end






  
 def safe

  user_logged = current_user.id
  @user = User.where(:id => user_logged).where("admin = 1")

 end
 
 
 def after

  # @safe = Safe.where(:number => params[:number])
   
   if !(params[:qnumber]).blank?

   @qry = params[:qnumber][0]
   @safes = Safe.where("number LIKE :search OR number_of_foundation LIKE :search OR number_of_frame LIKE :search OR number_slot LIKE :search", search: "%#{@qry}%").where("status = '在庫中'").paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)

 else

   if params[:number][0].start_with?("P1") == true
       @safes = Safe.where("status = '在庫中'").where(number: params[:number][0]).paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
   elsif params[:number][0].start_with?("P0") == true
   @safes = Safe.where("status = '在庫中'").where(number_of_frame: params[:number][0]).paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
  elsif params[:number][0].start_with?("P2") == true
   @safes = Safe.where("status = '在庫中'").where(number_of_foundation: params[:number][0]).paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
    else
        @safes = Safe.where("status = '在庫中'").where(number_slot: params[:number][0]).paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
    end
  end
    
 end
 
 

def show
   @safe = Safe.find(params[:id])
    
end


def new
  @safe = Safe.new
  
  if session[:hontai] == "true"
    @hontai =  { :checked => "checked"}
    @hontai2 =  { }
  elsif session[:hontai] == "false"
    @hontai =  { }
    @hontai2 =  { :checked => "checked"}
  end

  @safe_check1 = Safe.search(params[:number])
  respond_to do |format|
      format.html {}
      format.json { render :json => { record_exists: @safe_check.present?}}
  @result = params[:q]
end
  
end


def newclear

  session.delete(:name)
  session.delete(:from)
  session.delete(:price_from)
  session.delete(:remarks)
  session.delete(:hontai)
  
redirect_to new_safe_path

end












def create
#0

if params[:pachinko]
#1

  @safe = Safe.new(safe_params)
  @machine = "パチンコ"
  session[:name] = @safe.name
  session[:from] = @safe.from
  session[:price_from] = @safe.price_from
  session[:remarks] = @safe.remarks
  session[:place] = @safe.place
  session[:hontai] = @safe.hontai

  if session[:place] == "本社"
    @place = true
  elsif session[:place] == "菊水"
    @place2 = true
  end


      if @safe.save
      # 2 

        flash[:success] = "登録完了"
        
          if @safe.number.include?("AM") == true
            @maker5 = "アムテックス"
            elsif @safe.number.include?("AD") == true
            @maker5 = "エース電研"
            elsif @safe.number.include?("EE") == true
            @maker5 = "EXCITE"
            elsif @safe.number.include?("OZ") == true
            @maker5 = "オーイズミ"
            elsif @safe.number.include?("OM") == true
            @maker5 = "奥村遊戯"
            elsif @safe.number.include?("AA") == true
            @maker5 = "オッケー"
            elsif @safe.number.include?("OL") == true
            @maker5 = "オリンピア"
            elsif @safe.number.include?("BB") == true
            @maker5 = "京楽産業"
            elsif @safe.number.include?("GZ") == true
            @maker5 = "銀座"
            elsif @safe.number.include?("SS") == true
            @maker5 = "サミー"
            elsif @safe.number.include?("SA") == true
            @maker5 = "SANKYO"
            elsif @safe.number.include?("ST") == true
            @maker5 = "サンスリー"
            elsif @safe.number.include?("WW") == true
            @maker5 = "サンセイアールアンドディ"
            elsif @safe.number.include?("SY") == true
            @maker5 = "三洋物産"
            elsif @safe.number.include?("JJ") == true
            @maker5 = "JFJ"
            elsif @safe.number.include?("JB") == true
            @maker5 = "ジェイビー"
            elsif @safe.number.include?("SP") == true
            @maker5 = "ソフィア"
            elsif @safe.number.include?("DS") == true
            @maker5 = "大一商会"
            elsif @safe.number.include?("DT") == true
            @maker5 = "大都技研"
            elsif @safe.number.include?("TA") == true
            @maker5 = "タイヨーエレック"
            elsif @safe.number.include?("DW") == true
            @maker5 = "大和製作所"
            elsif @safe.number.include?("TU") == true
            @maker5 = "高尾"
            elsif @safe.number.include?("AB") == true
            @maker5 = "高砂電器産業"
            elsif @safe.number.include?("TK") == true
            @maker5 = "竹屋"
            elsif @safe.number.include?("DL") == true
            @maker5 = "デイ・ライト"
            elsif @safe.number.include?("TO") == true
            @maker5 = "豊丸産業"
            elsif @safe.number.include?("NS") == true
            @maker5 = "七匠"
            elsif @safe.number.include?("EX") == true
            @maker5 = "ニューギン"
            elsif @safe.number.include?("DA") == true
            @maker5 = "ビスティ"
            elsif @safe.number.include?("FJ") == true
            @maker5 = "藤商事"
            elsif @safe.number.include?("HC") == true
            @maker5 = "平和"
            elsif @safe.number.include?("BE") == true
            @maker5 = "ベルコ"
            elsif @safe.number.include?("MH") == true
            @maker5 = "マルホン"
            elsif @safe.number.include?("MZ") == true
            @maker5 = "ミズホ"
            elsif @safe.number.include?("CC") == true
            @maker5 = "メーシー"
            else
            @machine = "未"
          end

            @safe.update(:machine => @machine)
            @safe.update(:maker => @maker)

            redirect_back_or root_url

            # if @safe.hontai == "true"
            #   @safe.update(:type_machine => "本体")
            # end

      else
      # if @safe.save
      # 2 

        flash[:danger] = "既に登録済みか、何かしら問題があります。原因が不明な場合お問い合わせください"
        redirect_to "/safes/new"

      end
      # if @safe.save
      # 2

                
elsif params[:slot]
# if params[:pachinko]
# 1

  @safeslot = Safe.new(safe_params)
  @machine = "スロット"
  @type_machine = "なし"
  session[:name] = @safeslot.name
  session[:from] = @safeslot.from
  session[:price_from] = @safeslot.price_from
  session[:remarks] = @safeslot.remarks
  session[:place] = @safeslot.place
  session[:hontai] = @safeslot.hontai

  if session[:place] == "本社"
    @place = true
  elsif session[:place] == "菊水"
    @place2 = true
  end
                
                 
      
      if @safeslot.save
      # 2 
                          
        if @safeslot.number.include?("1A") == true
          @maker4 = "高砂電器産業"
          elsif @safeslot.number.include?("1P") == true
          @maker4 = "パイオニア"
          elsif @safeslot.number.include?("1F") == true
          @maker4 = "岡崎産業"
          elsif @safeslot.number.include?("1S") == true
          @maker4 = "サミー"
          elsif @safeslot.number.include?("1U") == true
          @maker4 = "ユニバーサルエンターテイメント"
          elsif @safeslot.number.include?("1O") == true
          @maker4 = "オリンピア"
          elsif @safeslot.number.include?("1N") == true
          @maker4 = "ネット"
          elsif @safeslot.number.include?("1K") == true
          @maker4 = "北電子"
          elsif @safeslot.number.include?("1C") == true
          @maker4 = "メーシー"
          elsif @safeslot.number.include?("1Y") == true
          @maker4 = "山佐"
          elsif @safeslot.number.include?("1V") == true
          @maker4 = "バルテック"
          elsif @safeslot.number.include?("1E") == true
          @maker4 = "大都技研"
          elsif @safeslot.number.include?("1B") == true
          @maker4 = "ロデオ"
          elsif @safeslot.number.include?("1G") == true
          @maker4 = "ベルコ"
          elsif @safeslot.number.include?("1J") == true
          @maker4 = "アリストクラークテクノロジーズ"
          elsif @safeslot.number.include?("1R") == true
          @maker4 = "オーイズミ"
          elsif @safeslot.number.include?("1Q") == true
          @maker4 = "ジェイビーエス"
          elsif @safeslot.number.include?("1X") == true
          @maker4 = "KPE"
          elsif @safeslot.number.include?("2S") == true
          @maker4 = "スパイキー"
          elsif @safeslot.number.include?("2Y") == true
          @maker4 = "ヤーマ"
          elsif @safeslot.number.include?("2P") == true
          @maker4 = "SNKプレイモア"
          elsif @safeslot.number.include?("2A") == true
          @maker4 = "アイ電子"
          elsif @safeslot.number.include?("2C") == true
          @maker4 = "中京遊技"
          elsif @safeslot.number.include?("2D") == true
          @maker4 = "DAXEL"
          elsif @safeslot.number.include?("2E") == true
          @maker4 = "エンタープライズ"
          else
          @maker4 = "未"
        end                             
       
         @safeslot.update(:type_machine => @type_machine)
         @safeslot.update(:machine => @machine)     
         @safeslot.update(:maker => @maker4)
         @safeslot.update(:number => @safeslot.number_slot )
        
        flash[:success] = "登録完了"
    
        redirect_back_or root_url

      else
      # if @safe.save
      # 2 

        flash[:danger] = "既に登録済みか、何かしら問題があります。原因が不明な場合お問い合わせください"
        redirect_to "/safes/new"

      end
      # if @safe.save
      # 2

                
  
end
# if params[:pachinko]
# if params[:slot]
# 1

end
# def create
# 0














def edit
    @safe = Safe.find(params[:id])
end


def edit2
    @safe = Safe.find(params[:id])
    

                      
    
end

def update

@safe = Safe.find(params[:id])


  if params[:edit]
 
                if @safe.status

                  @safe.update(safe_params)
                  
                        if @safe.month_of_manufacture == "no"
                        @safe.update(:date_of_removal => "null")
                        end
                        
                        if @safe.year_of_manufacture == "no"
                        @safe.update(:date_of_verification => "null")
                        end
                  
                  flash[:success] = "編集完了"
                  redirect_back_or root_url
                else
                  flash[:danger] = "権限がないか、既に完了したアクションです。"
                  redirect_back_or root_url
                end
                
            # end 
    
  else

                      if @safe.status && (@safe.status == "在庫中")
                        # if  @who_now == @who_seller
                        
 
                      
                      
                        @staff = current_user.name
                        @safe.update(:staff_two => @staff )
                        
                        @safe.update(safe_params)
                        
                        session[:to] = @safe.to
                              
                        flash[:success] = "出庫完了"
                        redirect_back_or root_url
                      else
                        flash[:danger] = "権限がないか、既に完了したアクションです。"
                        redirect_back_or root_url
                      end


  end

end  


  
  def destroy
    @safe = Safe.find(params[:id])
    @safe.destroy
      redirect_back_or root_url
  end


  private
  
   
  def read_shift_jis_encoded_params
    params_shift_jis = URI.decode_www_form(request.body.read, Encoding::Shift_JIS)
    params_shift_jis.each_with_object({}) do |(key, value), result|
      result[key.to_sym] = value.encode(Encoding::UTF_8, invalid: :replace, undef: :replace)
    end
  ensure
    request.body.rewind
  end
   
   
   
  def safe_params
    params.require(:safe).permit(:hontai, :name, :staff, :staff2, :type_machine, :number, :number_of_frame, :number_slot, :number_of_foundation, :status, :from, :to, :machine, :price_from, :remarks, :photo, :place, :maker, :year_of_manufacture, :month_of_manufacture, :color_of_panel, :date_of_removal, :date_of_verification)
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
