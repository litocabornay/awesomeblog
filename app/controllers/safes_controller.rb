class SafesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy, :csv_output_two, :csv_output_three, :csv_output_four, :csv_output_five, :csv_output_six, :csv_output, :csv_output_seven, :index2, :index2_2, :index2_3, :index2_4, :index2_5, :index1_2, :safe, :after, :edit2]
  # before_action :correct_user, only: [:index, :show, :new, :create, :edit, :edit, :update]
  before_action :admin_user, only: [:index, :show, :destroy, :csv_output_two, :csv_output_three, :csv_output_four, :csv_output_five, :csv_output_six, :csv_output, :csv_output_seven, :index2, :index2_2, :index2_3, :index2_4, :index2_5, :index1_2, :edit2]
  # before_action :set_current_user, only: [:index]
  





    
    
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
  
    #基盤
  def csv_output_five
    @safes = Safe.where("type_machine = '基盤'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "在庫_パチンコ_基盤のみ.csv", type: :csv
  end

    #スロット
  def csv_output_six
    @safes = Safe.where("machine = 'スロット'").where("status = '在庫中'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "在庫_スロット.csv", type: :csv
  end
  
    #履歴パチンコ
  def csv_output
    @safes = Safe.where("machine = 'パチンコ'").where.not("type_machine = '本体'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "履歴_パチンコ.csv", type: :csv
  end
  
    #履歴スロット
  def csv_output_seven
    @safes = Safe.where("machine = 'スロット'").where.not("type_machine = '本体'").order(sort_column + ' ' + sort_direction)
    send_data render_to_string, filename: "履歴_スロット.csv", type: :csv
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


  
 def safe

 end
 
 
 def after

  # @safe = Safe.where(:number => params[:number])
  


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

                                    
                                    if @safe.number.include?("AM") == true
                                    @maker = "アムテックス"
                                    elsif @safe.number.include?("AD") == true
                                    @maker = "エース電研"
                                    elsif @safe.number.include?("EE") == true
                                    @maker = "EXCITE"
                                    elsif @safe.number.include?("OZ") == true
                                    @maker = "オーイズミ"
                                    elsif @safe.number.include?("OM") == true
                                    @maker = "奥村遊戯"
                                    elsif @safe.number.include?("AA") == true
                                    @maker = "オッケー"
                                    elsif @safe.number.include?("OL") == true
                                    @maker = "オリンピア"
                                    elsif @safe.number.include?("BB") == true
                                    @maker = "京楽産業"
                                    elsif @safe.number.include?("GZ") == true
                                    @maker = "銀座"
                                    elsif @safe.number.include?("SS") == true
                                    @maker = "サミー"
                                    elsif @safe.number.include?("SA") == true
                                    @maker = "SANKYO"
                                    elsif @safe.number.include?("ST") == true
                                    @maker = "サンスリー"
                                    elsif @safe.number.include?("WW") == true
                                    @maker = "サンセイアールアンドディ"
                                    elsif @safe.number.include?("SY") == true
                                    @maker = "三洋物産"
                                    elsif @safe.number.include?("JJ") == true
                                    @maker = "JFJ"
                                    elsif @safe.number.include?("JB") == true
                                    @maker = "ジェイビー"
                                    elsif @safe.number.include?("SP") == true
                                    @maker = "ソフィア"
                                    elsif @safe.number.include?("DS") == true
                                    @maker = "大一商会"
                                    elsif @safe.number.include?("DT") == true
                                    @maker = "大都技研"
                                    elsif @safe.number.include?("TA") == true
                                    @maker = "タイヨーエレック"
                                    elsif @safe.number.include?("DW") == true
                                    @maker = "大和製作所"
                                    elsif @safe.number.include?("TU") == true
                                    @maker = "高尾"
                                    elsif @safe.number.include?("AB") == true
                                    @maker = "高砂電器産業"
                                    elsif @safe.number.include?("TK") == true
                                    @maker = "竹屋"
                                    elsif @safe.number.include?("DL") == true
                                    @maker = "デイ・ライト"
                                    elsif @safe.number.include?("TO") == true
                                    @maker = "豊丸産業"
                                    elsif @safe.number.include?("NS") == true
                                    @maker = "七匠"
                                    elsif @safe.number.include?("EX") == true
                                    @maker = "ニューギン"
                                    elsif @safe.number.include?("DA") == true
                                    @maker = "ビスティ"
                                    elsif @safe.number.include?("FJ") == true
                                    @maker = "藤商事"
                                    elsif @safe.number.include?("HC") == true
                                    @maker = "平和"
                                    elsif @safe.number.include?("BE") == true
                                    @maker = "ベルコ"
                                    elsif @safe.number.include?("MH") == true
                                    @maker = "マルホン"
                                    elsif @safe.number.include?("MZ") == true
                                    @maker = "ミズホ"
                                    elsif @safe.number.include?("CC") == true
                                    @maker = "メーシー"
                                    else
                                    @machine = "未"
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
                                    @safe.update(:maker => @maker)

                                    
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
                                
      
                                  
                                    if @safe2.number_of_frame.include?("AM") == true
                                    @maker2 = "アムテックス"
                                    elsif @safe2.number_of_frame.include?("AD") == true
                                    @maker2 = "エース電研"
                                    elsif @safe2.number_of_frame.include?("EE") == true
                                    @maker2 = "EXCITE"
                                    elsif @safe2.number_of_frame.include?("OZ") == true
                                    @maker2 = "オーイズミ"
                                    elsif @safe2.number_of_frame.include?("OM") == true
                                    @maker2 = "奥村遊戯"
                                    elsif @safe2.number_of_frame.include?("AA") == true
                                    @maker2 = "オッケー"
                                    elsif @safe2.number_of_frame.include?("OL") == true
                                    @maker2 = "オリンピア"
                                    elsif @safe2.number_of_frame.include?("BB") == true
                                    @maker2 = "京楽産業"
                                    elsif @safe2.number_of_frame.include?("GZ") == true
                                    @maker2 = "銀座"
                                    elsif @safe2.number_of_frame.include?("SS") == true
                                    @maker2 = "サミー"
                                    elsif @safe2.number_of_frame.include?("SA") == true
                                    @maker2 = "SANKYO"
                                    elsif @safe2.number_of_frame.include?("ST") == true
                                    @maker2 = "サンスリー"
                                    elsif @safe2.number_of_frame.include?("WW") == true
                                    @maker2 = "サンセイアールアンドディ"
                                    elsif @safe2.number_of_frame.include?("SY") == true
                                    @maker2 = "三洋物産"
                                    elsif @safe2.number_of_frame.include?("JJ") == true
                                    @maker2 = "JFJ"
                                    elsif @safe2.number_of_frame.include?("JB") == true
                                    @maker2 = "ジェイビー"
                                    elsif @safe2.number_of_frame.include?("SP") == true
                                    @maker2 = "ソフィア"
                                    elsif @safe2.number_of_frame.include?("DS") == true
                                    @maker2 = "大一商会"
                                    elsif @safe2.number_of_frame.include?("DT") == true
                                    @maker2 = "大都技研"
                                    elsif @safe2.number_of_frame.include?("TA") == true
                                    @maker2 = "タイヨーエレック"
                                    elsif @safe2.number_of_frame.include?("DW") == true
                                    @maker2 = "大和製作所"
                                    elsif @safe2.number_of_frame.include?("TU") == true
                                    @maker2 = "高尾"
                                    elsif @safe2.number_of_frame.include?("AB") == true
                                    @maker2 = "高砂電器産業"
                                    elsif @safe2.number_of_frame.include?("TK") == true
                                    @maker2 = "竹屋"
                                    elsif @safe2.number_of_frame.include?("DL") == true
                                    @maker2 = "デイ・ライト"
                                    elsif @safe2.number_of_frame.include?("TO") == true
                                    @maker2 = "豊丸産業"
                                    elsif @safe2.number_of_frame.include?("NS") == true
                                    @maker2 = "七匠"
                                    elsif @safe2.number_of_frame.include?("EX") == true
                                    @maker2 = "ニューギン"
                                    elsif @safe2.number_of_frame.include?("DA") == true
                                    @maker2 = "ビスティ"
                                    elsif @safe2.number_of_frame.include?("FJ") == true
                                    @maker2 = "藤商事"
                                    elsif @safe2.number_of_frame.include?("HC") == true
                                    @maker2 = "平和"
                                    elsif @safe2.number_of_frame.include?("BE") == true
                                    @maker2 = "ベルコ"
                                    elsif @safe2.number_of_frame.include?("MH") == true
                                    @maker2 = "マルホン"
                                    elsif @safe2.number_of_frame.include?("MZ") == true
                                    @maker2 = "ミズホ"
                                    elsif @safe2.number_of_frame.include?("CC") == true
                                    @maker2 = "メーシー"
                                    else
                                    @machine = "未"
                                    end
                                
                                
                                @safe2.update(:type_machine => @type_machine2)
                                @safe2.update(:machine => @machine2)
                                @safe2.update(:maker => @maker2)
                                
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
                                

                                    
                                    if @safe3.number_of_foundation.include?("AM") == true
                                    @maker3 = "アムテックス"
                                    elsif @safe3.number_of_foundation.include?("AD") == true
                                    @maker3 = "エース電研"
                                    elsif @safe3.number_of_foundation.include?("EE") == true
                                    @maker3 = "EXCITE"
                                    elsif @safe3.number_of_foundation.include?("OZ") == true
                                    @maker3 = "オーイズミ"
                                    elsif @safe3.number_of_foundation.include?("OM") == true
                                    @maker3 = "奥村遊戯"
                                    elsif @safe3.number_of_foundation.include?("AA") == true
                                    @maker3 = "オッケー"
                                    elsif @safe3.number_of_foundation.include?("OL") == true
                                    @maker3 = "オリンピア"
                                    elsif @safe3.number_of_foundation.include?("BB") == true
                                    @maker3 = "京楽産業"
                                    elsif @safe3.number_of_foundation.include?("GZ") == true
                                    @maker3 = "銀座"
                                    elsif @safe3.number_of_foundation.include?("SS") == true
                                    @maker3 = "サミー"
                                    elsif @safe3.number_of_foundation.include?("SA") == true
                                    @maker3 = "SANKYO"
                                    elsif @safe3.number_of_foundation.include?("ST") == true
                                    @maker3 = "サンスリー"
                                    elsif @safe3.number_of_foundation.include?("WW") == true
                                    @maker3 = "サンセイアールアンドディ"
                                    elsif @safe3.number_of_foundation.include?("SY") == true
                                    @maker3 = "三洋物産"
                                    elsif @safe3.number_of_foundation.include?("JJ") == true
                                    @maker3 = "JFJ"
                                    elsif @safe3.number_of_foundation.include?("JB") == true
                                    @maker3 = "ジェイビー"
                                    elsif @safe3.number_of_foundation.include?("SP") == true
                                    @maker3 = "ソフィア"
                                    elsif @safe3.number_of_foundation.include?("DS") == true
                                    @maker3 = "大一商会"
                                    elsif @safe3.number_of_foundation.include?("DT") == true
                                    @maker3 = "大都技研"
                                    elsif @safe3.number_of_foundation.include?("TA") == true
                                    @maker3 = "タイヨーエレック"
                                    elsif @safe3.number_of_foundation.include?("DW") == true
                                    @maker3 = "大和製作所"
                                    elsif @safe3.number_of_foundation.include?("TU") == true
                                    @maker3 = "高尾"
                                    elsif @safe3.number_of_foundation.include?("AB") == true
                                    @maker3 = "高砂電器産業"
                                    elsif @safe3.number_of_foundation.include?("TK") == true
                                    @maker3 = "竹屋"
                                    elsif @safe3.number_of_foundation.include?("DL") == true
                                    @maker3 = "デイ・ライト"
                                    elsif @safe3.number_of_foundation.include?("TO") == true
                                    @maker3 = "豊丸産業"
                                    elsif @safe3.number_of_foundation.include?("NS") == true
                                    @maker3 = "七匠"
                                    elsif @safe3.number_of_foundation.include?("EX") == true
                                    @maker3 = "ニューギン"
                                    elsif @safe3.number_of_foundation.include?("DA") == true
                                    @maker3 = "ビスティ"
                                    elsif @safe3.number_of_foundation.include?("FJ") == true
                                    @maker3 = "藤商事"
                                    elsif @safe3.number_of_foundation.include?("HC") == true
                                    @maker3 = "平和"
                                    elsif @safe3.number_of_foundation.include?("BE") == true
                                    @maker3 = "ベルコ"
                                    elsif @safe3.number_of_foundation.include?("MH") == true
                                    @maker3 = "マルホン"
                                    elsif @safe3.number_of_foundation.include?("MZ") == true
                                    @maker3 = "ミズホ"
                                    elsif @safe3.number_of_foundation.include?("CC") == true
                                    @maker3 = "メーシー"
                                    else
                                    @machine = "未"
                                    end
                                
                                @safe3.update(:type_machine => @type_machine3)
                                @safe3.update(:machine => @machine3)
                                @safe3.update(:maker => @maker3)
                                
                                
                            end
            
            
            
                            unless ( @safe.number.blank? || @safe.number_of_frame.blank? || @safe.number_of_foundation.blank? )
                                @safe4.save
             
                                    @machine4 = "パチンコ"
                                    @type_machine4 = "本体"

                                    
                                    if @safe4.number.include?("AM") == true
                                    @maker5 = "アムテックス"
                                    elsif @safe4.number.include?("AD") == true
                                    @maker5 = "エース電研"
                                    elsif @safe4.number.include?("EE") == true
                                    @maker5 = "EXCITE"
                                    elsif @safe4.number.include?("OZ") == true
                                    @maker5 = "オーイズミ"
                                    elsif @safe4.number.include?("OM") == true
                                    @maker5 = "奥村遊戯"
                                    elsif @safe4.number.include?("AA") == true
                                    @maker5 = "オッケー"
                                    elsif @safe4.number.include?("OL") == true
                                    @maker5 = "オリンピア"
                                    elsif @safe4.number.include?("BB") == true
                                    @maker5 = "京楽産業"
                                    elsif @safe4.number.include?("GZ") == true
                                    @maker5 = "銀座"
                                    elsif @safe4.number.include?("SS") == true
                                    @maker5 = "サミー"
                                    elsif @safe4.number.include?("SA") == true
                                    @maker5 = "SANKYO"
                                    elsif @safe4.number.include?("ST") == true
                                    @maker5 = "サンスリー"
                                    elsif @safe4.number.include?("WW") == true
                                    @maker5 = "サンセイアールアンドディ"
                                    elsif @safe4.number.include?("SY") == true
                                    @maker5 = "三洋物産"
                                    elsif @safe4.number.include?("JJ") == true
                                    @maker5 = "JFJ"
                                    elsif @safe4.number.include?("JB") == true
                                    @maker5 = "ジェイビー"
                                    elsif @safe4.number.include?("SP") == true
                                    @maker5 = "ソフィア"
                                    elsif @safe4.number.include?("DS") == true
                                    @maker5 = "大一商会"
                                    elsif @safe4.number.include?("DT") == true
                                    @maker5 = "大都技研"
                                    elsif @safe4.number.include?("TA") == true
                                    @maker5 = "タイヨーエレック"
                                    elsif @safe4.number.include?("DW") == true
                                    @maker5 = "大和製作所"
                                    elsif @safe4.number.include?("TU") == true
                                    @maker5 = "高尾"
                                    elsif @safe4.number.include?("AB") == true
                                    @maker5 = "高砂電器産業"
                                    elsif @safe4.number.include?("TK") == true
                                    @maker5 = "竹屋"
                                    elsif @safe4.number.include?("DL") == true
                                    @maker5 = "デイ・ライト"
                                    elsif @safe4.number.include?("TO") == true
                                    @maker5 = "豊丸産業"
                                    elsif @safe4.number.include?("NS") == true
                                    @maker5 = "七匠"
                                    elsif @safe4.number.include?("EX") == true
                                    @maker5 = "ニューギン"
                                    elsif @safe4.number.include?("DA") == true
                                    @maker5 = "ビスティ"
                                    elsif @safe4.number.include?("FJ") == true
                                    @maker5 = "藤商事"
                                    elsif @safe4.number.include?("HC") == true
                                    @maker5 = "平和"
                                    elsif @safe4.number.include?("BE") == true
                                    @maker5 = "ベルコ"
                                    elsif @safe4.number.include?("MH") == true
                                    @maker5 = "マルホン"
                                    elsif @safe4.number.include?("MZ") == true
                                    @maker5 = "ミズホ"
                                    elsif @safe4.number.include?("CC") == true
                                    @maker5 = "メーシー"
                                    else
                                    @machine = "未"
                                    end
                                    
                                    
                                @safe4.update(:type_machine => @type_machine4)
                                @safe4.update(:machine => @machine4)

                                @safe4.update(:maker => @maker5)

                                
                                @safe2.update(:price_from => 0)
                                @safe3.update(:price_from => 0)

                                
                            end
            
            
                redirect_to "/"

                  

                
                
                
                
  else
                
  @safeslot = Safe.new(safe_params)
                
                
                
                unless ( @safeslot.number_slot.blank? )

                if session[:place] == "本社"
                  @place = true
                elsif session[:place] == "菊水"
                  @place2 = true
                end
                
                 @safeslot.update(:number => @safeslot.number_slot )
                
                if @safeslot.save
              
                                    
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
                                    
                session[:name] = @safeslot.name
                session[:from] = @safeslot.from
                session[:price_from] = @safeslot.price_from
                session[:remarks] = @safeslot.remarks
                session[:place] = @safeslot.place
                
                 @machine = "スロット"
                 @type_machine = "なし"
                 
                 
                 @safeslot.update(:type_machine => @type_machine)
                 @safeslot.update(:machine => @machine)     
                 @safeslot.update(:maker => @maker4)
                
                flash[:success] = "登録完了"
            
            
                redirect_to "/"
                else
                  render 'new'
                end
                end
              
  end
  
end




def edit
    @safe = Safe.find(params[:id])
end


def edit2
    @safe = Safe.find(params[:id])
    

                      
    
end

def update

@safe = Safe.find(params[:id])

if  @safe.id > 3
@id2 = @safe.id - 3
@id3 = @safe.id - 2
@id4 = @safe.id - 1
@safe2 = Safe.find(@id2)
@safe3 = Safe.find(@id3)
@safe4 = Safe.find(@id4)
end

  if params[:edit]
    #以下ノーマルedit
    
              
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
                        
                        if @safe.month_of_manufacture == "no"
                        @safe.update(:date_of_removal => "null")
                        @safe2.update(:date_of_removal => "null")
                        @safe3.update(:date_of_removal => "null")
                        @safe4.update(:date_of_removal => "null")
                        end
                        
                        if @safe.year_of_manufacture == "no"
                        @safe.update(:date_of_verification => "null")
                        @safe2.update(:date_of_verification => "null")
                        @safe3.update(:date_of_verification => "null")
                        @safe4.update(:date_of_verification => "null")
                        end
                        
                        

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
    #以下単体
                if @safe.status && (@safe.status == "在庫中")

                  @safe.update(safe_params)
                  
                        if @safe.month_of_manufacture == "no"
                        @safe.update(:date_of_removal => "null")
                        end
                        
                        if @safe.year_of_manufacture == "no"
                        @safe.update(:date_of_verification => "null")
                        end
                  
                  flash[:success] = "出庫完了"
                  redirect_to root_url
                else
                  flash[:danger] = "権限がないか、既に完了したアクションです。"
                  redirect_to root_url
                end
                
            end 
    
  else
    #以下出庫作業

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


  
  def destroy
    @safe = Safe.find(params[:id])
    @safe.destroy
      redirect_to safes_path
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