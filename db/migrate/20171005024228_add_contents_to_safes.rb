class AddContentsToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :machine, :string
    add_column :saves, :price_from, :integer
    add_column :saves, :price_after, :integer
    add_column :saves, :remarks, :string
    add_column :saves, :photo, :string, default:"No-image-found.jpg"
  end
end