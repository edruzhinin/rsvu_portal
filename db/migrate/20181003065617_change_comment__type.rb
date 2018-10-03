class ChangeCommentType < ActiveRecord::Migration
  def change
  	change_column :device_types, :comment, :text
  	change_column :devices, :comment, :text
  	change_column :hardware_types, :comment, :text
  	change_column :hardwares, :comment, :text
  	change_column :software_types, :comment, :text
  	add_column :softwares, :comment, :text
  	change_column :locations, :comment, :text
  end
end
