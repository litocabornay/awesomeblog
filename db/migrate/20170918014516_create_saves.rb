class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.string :status, default:"one"
      t.string :name
      t.string :staff
      t.string :type_machine
      t.string :from
      t.string :to
      t.string :number
    

    
    
      t.timestamps null: false
    end
  end
end
