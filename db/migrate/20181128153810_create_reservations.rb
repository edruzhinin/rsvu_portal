class CreateReservations < ActiveRecord::Migration
  def change
    drop_table :reservations
    
    create_table :reservations do |t|
      t.references :event, index: true
      t.references :reservable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :reservations, :events
  end
end
