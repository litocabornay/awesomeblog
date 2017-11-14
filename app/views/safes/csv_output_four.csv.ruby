require 'csv'

CSV.generate do |csv|
  csv_column_names = ["ID","機種","種別","メーカー","機種名","価格","倉庫","枠番号","入庫日時","入庫先","入庫登録者","撤去日","検定日","パネル色","備考","状態"]
  csv << csv_column_names
  @safes.each do |safe|
    csv_column_values = [
      safe.id,
      safe.machine,
      safe.type_machine,
      safe.maker,
      safe.name,
      safe.price_from,
      safe.place,
      safe.number_of_frame,
      safe.created_at,
      safe.from,
      safe.staff,
      safe.date_of_removal,
      safe.date_of_verification,
      safe.color_of_panel,
      safe.remarks,
      safe.status
    ]
    csv << csv_column_values
  end
end