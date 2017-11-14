class AddActivationewToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reccent_deposit, :integer
  end
end
