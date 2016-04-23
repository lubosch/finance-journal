class CreateAccountTransactions < ActiveRecord::Migration
  def change
    create_table :account_transactions do |t|
      t.references :account, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :purpose
      t.float :value
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
