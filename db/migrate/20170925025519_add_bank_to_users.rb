class AddBankToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank_name, :string
    add_column :users, :bank_branch, :string
    add_column :users, :bank_username, :string
    add_column :users, :bank_type, :string
  end
end
