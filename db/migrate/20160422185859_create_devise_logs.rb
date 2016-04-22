class CreateDeviseLogs < ActiveRecord::Migration
  def change
    create_table :devise_logs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :action

      t.timestamps null: false
    end
  end
end
