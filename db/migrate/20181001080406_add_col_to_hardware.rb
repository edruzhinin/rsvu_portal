class AddColToHardware < ActiveRecord::Migration
  def change
    add_column :hardwares, :status, :integer
    add_column :hardwares, :description, :string
  end
end
