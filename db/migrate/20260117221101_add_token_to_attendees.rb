class AddTokenToAttendees < ActiveRecord::Migration[8.1]
  def change
    add_column :attendees, :token, :string
    add_index :attendees, :token
  end
end
