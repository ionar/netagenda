class ChangeBirthDataNameOnClients < ActiveRecord::Migration[5.2]
  def change
  	rename_column :clients, :birth_data, :birth_date
  end
end
