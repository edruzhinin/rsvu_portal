class AddHeightToHardwares < ActiveRecord::Migration
  def change
    add_column :hardwares, :height, :integer
  end
end
