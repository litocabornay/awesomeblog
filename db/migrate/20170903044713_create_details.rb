class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :company_name
      
      t.timestamps null: false
    end
  end
end
