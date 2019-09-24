class HardwaresAddPosition < ActiveRecord::Migration
  def change
  add_column :hardwares, :position, :integer
  end
end
