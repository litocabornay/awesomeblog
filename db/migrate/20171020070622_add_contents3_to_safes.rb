class AddContents3ToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :date_of_verification, :date
    add_column :saves, :date_of_removal, :date
    add_column :saves, :color_of_panel, :string
    add_column :saves, :number_of_frame, :string
    add_column :saves, :number_of_foundation, :string
    add_column :saves, :string, :string
  end
end
