json.extract! client, :id, :name, :whatsapp, :phone, :address, :cep, :city, :province, :birth_data, :cpf, :rg, :email, :occupation, :notes, :created_at, :updated_at
json.url client_url(client, format: :json)
