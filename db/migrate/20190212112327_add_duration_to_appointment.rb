class AddDurationToAppointment < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :duration, :integer
  end
end
