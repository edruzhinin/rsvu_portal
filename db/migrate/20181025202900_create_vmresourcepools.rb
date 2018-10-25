class CreateVmresourcepools < ActiveRecord::Migration
  def change
    create_table :vmresourcepools do |t|
      t.references :vmhost, index: true
      t.string :name
      t.integer :status
      t.integer :parent_id

      t.timestamps null: false
    end
    add_foreign_key :vmresourcepools, :vmhosts
  end
end
