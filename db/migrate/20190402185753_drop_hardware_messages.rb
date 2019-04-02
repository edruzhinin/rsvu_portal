class DropHardwareMessages < ActiveRecord::Migration
  def change
  	drop_table :hardware_messages	
  	
  end
end
