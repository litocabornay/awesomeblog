class CreateAdds < ActiveRecord::Migration
  def change
    create_table :adds do |t|

      t.timestamps null: false
    end
  end
end
