class AddContents2ToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :place, :string
    add_column :saves, :maker, :string
    add_column :saves, :year_of_manufacture, :string
    add_column :saves, :month_of_manufacture, :string
  end
end
