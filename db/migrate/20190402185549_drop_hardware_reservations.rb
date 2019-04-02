class DropHardwareReservations < ActiveRecord::Migration
  def change
  	drop_table :hardware_reservations
  end
end
