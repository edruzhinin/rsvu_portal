class CreateGroupRelations < ActiveRecord::Migration
  def change
    create_table :group_relations do |t|
      t.references :group, index: true
      t.references :groupable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :group_relations, :groups
  end
end
