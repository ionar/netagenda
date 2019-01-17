class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.datetime :start_time
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
