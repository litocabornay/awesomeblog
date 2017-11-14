class AddContents4ToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :date_of_out, :date
  end
end
