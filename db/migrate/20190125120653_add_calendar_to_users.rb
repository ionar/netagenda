class AddCalendarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :calendar, foreign_key: true
  end
end
