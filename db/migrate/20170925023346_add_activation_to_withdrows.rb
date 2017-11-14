class AddActivationToWithdrows < ActiveRecord::Migration
  def change
    add_column :withdrows, :status, :string
  end
end
