class CreateMakers < ActiveRecord::Migration
  def change
    create_table :makers do |t|
      t.string :name
      t.string :name2
      t.timestamps null: false
    end
  end
end
