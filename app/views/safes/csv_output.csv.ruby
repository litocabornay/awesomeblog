require 'csv'


      
CSV.generate do |csv|
  csv_column_names = ["ID","機種","種別","メーカー","機器番号","機種名","入庫日時","出庫日時","入庫先","出庫先","入庫登録者","出庫登録者","価格","撤去日","検定日","倉庫","パネル色","備考","状態"]
  csv << csv_column_names
  @safes.each do |safe|
  
      if safe.type_machine == "セル"
      @cell = safe.number

      elsif safe.type_machine == "枠"
      @cell = safe.number_of_frame

      elsif safe.type_machine == "基盤"
      @cell = safe.number_of_foundation
      
      else
      @cell = ""
      end
      
      if safe.status == "出庫済"
      @edit = safe.updated_at.strftime("%y/%m/%d")
      else
      @edit = ""
      end
      
      if safe.status == "出庫済"
      @to = safe.to
      else
      @to = ""
      end
      
      if safe.status == "出庫済"
      @staff_two = safe.staff_two
      else
      @staff_two = ""
      end
      
      
      
      
    csv_column_values = [
      safe.id,
      safe.machine,
      safe.type_machine,
      safe.maker,
      @cell,
      safe.name,
      safe.created_at.strftime("%y/%m/%d"),
      @edit,
      safe.from,
      @to,
      safe.staff,
      @staff_two,
      safe.price_from,
      safe.date_of_removal,
      safe.date_of_verification,
      safe.place,
      safe.color_of_panel,
      safe.remarks,
      safe.status
    ]
    csv << csv_column_values
  end
end