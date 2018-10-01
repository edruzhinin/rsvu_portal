class AddFieldToHardware < ActiveRecord::Migration
  def change
  	add_column :hardwares, :model_number, :string
  	add_column :hardwares, :place, :string
  	
  end
end
