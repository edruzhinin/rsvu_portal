class AddSoftwares < ActiveRecord::Migration
  def change
  	create_table :software_types do |t|
      t.string :name
      t.string :comment
      t.string :sparam1
      t.string :sparam2
      t.string :sparam3
      t.string :iparam1
      t.string :iparam2
      t.string :iparam3
		end
		
		create_table :softwares do |t|
      t.integer :software_type
      t.string :name
      t.string :description
      t.string :comment
      t.string :sparam1
      t.string :sparam2
      t.string :sparam3
      t.integer :iparam1
      t.integer :iparam2
      t.integer :iparam3
      t.integer :status
		end
  end
end
