class AddActivation2ToSells < ActiveRecord::Migration
  def change
    add_column :sells, :type_machine, :string
  end
end
