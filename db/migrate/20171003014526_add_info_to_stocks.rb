class AddInfoToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :name, :string
    add_column :stocks, :staff, :string
    add_column :stocks, :type, :string
    add_column :stocks, :status, :string
  end
end
