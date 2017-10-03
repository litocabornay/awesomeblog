class AddBank2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank_number, :integer
  end
end
