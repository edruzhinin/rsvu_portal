class CreateVms < ActiveRecord::Migration
  def change
    create_table :vms do |t|
      t.references :vmresourcepool, index: true
      t.string :name
      t.string :guest
      t.string :uuid
      t.integer :state
      t.string :ip
      t.datetime :boottime
      t.string :annotation
      t.boolean :vmtools
      t.string :path

      t.timestamps null: false
    end
    add_foreign_key :vms, :vmresourcepools
  end
end
