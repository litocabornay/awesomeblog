class AddActivationToSells < ActiveRecord::Migration
  def change
    add_column :sells, :status, :string,                         default: "受付中"
    add_column :sells, :place, :string
    add_column :sells, :price, :integer
    add_column :sells, :removal_date, :string
    add_column :sells, :remnant, :string
    add_column :sells, :stage, :string
    add_column :sells, :condition, :string
    add_column :sells, :remarks, :string
  end
end
