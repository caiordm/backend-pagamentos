class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nome_completo
      t.string :cpfcnpj, limit: 40
      t.string :email
      t.string :senha
      t.string :type_user

      t.timestamps
    end
    add_index :users, :cpfcnpj, unique: true
    add_index :users, :email, unique: true
  end
end
