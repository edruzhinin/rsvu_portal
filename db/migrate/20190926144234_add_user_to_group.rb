class AddUserToGroup < ActiveRecord::Migration
  def change
  	add_column :groups, :user_id, :integer 
  	add_column :groups, :global, :boolean
  end
end
