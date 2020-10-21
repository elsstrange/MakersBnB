class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :host_id
    end
    add_foreign_key :spaces, :users, column: :host_id
  end
end
