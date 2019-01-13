class AddUserToHardwares < ActiveRecord::Migration
  def change
  	add_column :hardwares, :user_id, :integer
  end
end
