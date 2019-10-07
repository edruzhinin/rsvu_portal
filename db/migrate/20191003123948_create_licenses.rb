class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :type
      t.string :name
      t.datetime :from_time
      t.datetime :to_time
      t.integer :lic_count
      t.text :description

      t.timestamps null: false
    end
  end
end
