class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.string :status, default:"在庫中"
      t.string :name
      t.string :staff, default:"まだ"
      t.string :staff_two, default:"まだ"
      t.string :type_machine
      t.string :from
      t.string :to, default:"まだ"
      t.string :number
    
      
    
    
      t.timestamps null: false
    end
  end
end
