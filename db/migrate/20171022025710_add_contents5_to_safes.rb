class AddContents5ToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :number_slot, :integer
  end
end
