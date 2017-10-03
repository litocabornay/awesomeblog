class CreateWithdrows < ActiveRecord::Migration
  def change
    create_table :withdrows do |t|
      t.integer :user_id
      t.integer :price
      
      
      t.timestamps null: false
    end
  end
end
