class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.float :value
      t.float :critical_value
      t.boolean :notification

      t.timestamps null: false
    end
  end
end
