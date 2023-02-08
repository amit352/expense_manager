class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :category, null: false, foreign_key: true
      t.references :sub_category, null: false, foreign_key: true
      t.references :transaction_mode, null: true, foreign_key: true
      t.references :issuer, null: false, foreign_key: { to_table: :transaction_parties }
      t.references :beneficiary, null: false, foreign_key: { to_table: :transaction_parties }
      t.decimal :amount, precision: 8, scale: 2, default: 0
      t.integer :type
      t.date :date
      t.text :memo
      t.string :receipts

      t.timestamps
    end
  end
end
