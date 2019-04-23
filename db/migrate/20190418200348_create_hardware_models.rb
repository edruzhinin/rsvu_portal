class CreateHardwareModels < ActiveRecord::Migration
  def change
    create_table :hardware_models do |t|
      t.string :name
      t.string :modelNo
      t.text :comment
      t.string :sparam1
      t.string :sparam2
      t.string :sparam3
      t.integer :iparam1
      t.integer :iparam2
      t.integer :iparam3
      t.references :hardware_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :hardware_models, :hardware_types
  end
end
