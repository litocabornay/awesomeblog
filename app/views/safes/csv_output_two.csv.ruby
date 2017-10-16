require 'csv'

CSV.generate do |csv|
  csv_column_names = ["ID","機種","種別","機器番号","入庫日時","出庫日時","機種名","倉庫","入庫登録者","出庫登録者","入庫先","出庫先","価格","備考","画像","状況","p-sensor"]
  csv << csv_column_names
  @safes.each do |safe|
    csv_column_values = [
      safe.id,
      safe.machine,
      safe.type_machine,
      safe.number,
      safe.created_at,
      safe.updated_at,
      safe.name,
      safe.place,
      safe.staff,
      safe.staff_two,
      safe.from,
      safe.to,
      safe.price_from,
      safe.remarks,
      safe.photo,
      safe.status,
    ]
    csv << csv_column_values
  end
end