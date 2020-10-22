class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date, :null => false
      t.string :status, :default => 'pending', :null => false
      t.integer :space_id, :null => false
      t.integer :guest_id, :null => false
      t.timestamps null: false
    end
    add_foreign_key :bookings, :users, column: :guest_id
    add_foreign_key :bookings, :spaces, column: :space_id
  end
end
