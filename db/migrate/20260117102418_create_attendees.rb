class CreateAttendees < ActiveRecord::Migration[8.1]
  def change
    create_table :attendees do |t|
      t.string :full_name
      t.string :company
      t.string :role
      t.string :email
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
