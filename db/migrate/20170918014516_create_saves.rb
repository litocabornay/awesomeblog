class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.boolean :archive,                     default: false
      t.boolean :archive_seller,              default: false
      t.string :status
      t.integer :seller_id
      t.integer :sell_id
      t.integer :buyer_id
      t.string :date_of_arrive
      t.integer :confirm_price
      t.integer :confirm_number
      t.string :limit_of_inspection

      t.timestamps null: false
    end
  end
end
