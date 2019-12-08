class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :name
      t.references :vm, index: true
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :archives, :vms
  end
end
