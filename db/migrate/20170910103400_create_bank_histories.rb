class CreateBankHistories < ActiveRecord::Migration
  def change
    create_table :bank_histories do |t|
      t.integer :user_id
      t.integer :price_from
      t.integer :price
      t.integer :price_to
      t.string :action

      t.timestamps null: false
    end
  end
end
