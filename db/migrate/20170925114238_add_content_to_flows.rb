class AddContentToFlows < ActiveRecord::Migration
  def change
    add_column :flows, :content, :string
  end
end
