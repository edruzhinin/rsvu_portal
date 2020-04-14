class AddResourcePool < ActiveRecord::Migration
  def change
  	add_column :vmresourcepools, :creator_id, :integer
  	add_column :vmresourcepools, :valid_to, :date
  end
end
