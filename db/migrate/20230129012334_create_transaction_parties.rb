class CreateTransactionParties < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_parties do |t|
      t.string :nominee
      t.string :branch
      t.string :account
      t.boolean :third_party
      t.decimal :balance, precision: 8, scale: 2, default: 0
      t.timestamps
    end
  end
end
