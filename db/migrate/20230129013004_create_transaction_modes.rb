class CreateTransactionModes < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_modes do |t|
      t.string :name

      t.timestamps
    end
  end
end
