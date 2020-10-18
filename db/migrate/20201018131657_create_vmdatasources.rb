class CreateVmdatasources < ActiveRecord::Migration
  def change
    create_table :vmdatasources do |t|
      t.references :vmhost, index: true
      t.string :ds_id
      t.string :ds_name
      t.integer :ds_status
      t.string :ds_url
      t.string :ds_type
      t.boolean :ds_accessible
      t.integer :ds_capacity
      t.integer :ds_freespace
      t.integer :ds_uncommited

      t.timestamps null: false
    end
    add_foreign_key :vmdatasources, :vmhosts
  end
end
