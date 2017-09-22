class AddActivationToSells < ActiveRecord::Migration
  def change
    add_column :sells, :status, :string,                         default: "受付中"
    add_column :sells, :place, :string
    add_column :sells, :price, :integer
    add_column :sells, :removal, :string
    add_column :sells, :remnant, :string,                         default: "撤去済"
    add_column :sells, :stage, :string
    add_column :sells, :condition, :string
    add_column :sells, :remarks, :string
  end
end
