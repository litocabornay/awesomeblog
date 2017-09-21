class CreateRails < ActiveRecord::Migration
  def change
    create_table :rails do |t|
      t.string :generate
      t.string :model
      t.string :pay_relationship

      t.timestamps null: false
    end
  end
end
