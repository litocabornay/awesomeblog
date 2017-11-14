class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :company
      t.integer :before_price,      default: 0
      t.integer :year_date
      t.integer :month_date
      t.integer :day_date
      t.integer :price,      default: 0
      t.integer :after_price,      default: 0
      t.string :staff
      t.string :memo

      
      t.timestamps null: false
    end
  end
end
