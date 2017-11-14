class AddContents5ToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :number_slot, :string
  end
end
