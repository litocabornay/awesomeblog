class AddAdiminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    #default: falseは、migrationの後に追加。
  end
end
