class HardwareAddModelId < ActiveRecord::Migration
  def change
  	add_column :hardwares, :hardware_model_id, :integer
  	add_column	:hardwares, :canBook, :boolean
  end
end
