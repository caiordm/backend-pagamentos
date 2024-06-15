class CreateTransfers < ActiveRecord::Migration[7.1]
  def change
    create_table :transfers do |t|
      t.references :payee, null: false, foreign_key: { to_table: :users }
      t.references :payer, null: false, foreign_key: { to_table: :users }
      t.float :value

      t.timestamps
    end
  end
end
