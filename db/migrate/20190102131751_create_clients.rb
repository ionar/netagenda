class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :whatsapp
      t.string :phone
      t.string :address
      t.string :cep
      t.string :city
      t.string :province
      t.date :birth_data
      t.string :cpf
      t.string :rg
      t.string :email
      t.string :occupation
      t.text :notes

      t.timestamps
    end
  end
end
