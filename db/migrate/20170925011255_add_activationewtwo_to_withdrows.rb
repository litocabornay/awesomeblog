class AddActivationewtwoToWithdrows < ActiveRecord::Migration
  def change
    add_column :withdrows, :message, :string
  end
end
