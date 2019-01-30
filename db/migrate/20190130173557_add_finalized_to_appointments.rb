class AddFinalizedToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :finalized, :boolean
  end
end
