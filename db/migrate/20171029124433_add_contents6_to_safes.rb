class AddContents6ToSafes < ActiveRecord::Migration
  def change
    add_column :saves, :hontai, :string
  end
end
