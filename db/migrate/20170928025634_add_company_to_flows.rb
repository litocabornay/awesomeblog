class AddCompanyToFlows < ActiveRecord::Migration
  def change
    add_column :flows, :pass_company, :string
    add_column :flows, :recieve_company, :string
  end
end
