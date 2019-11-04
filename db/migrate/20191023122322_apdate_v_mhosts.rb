class ApdateVMhosts < ActiveRecord::Migration
  def change
  	add_column :vmhosts, :vendor, :string
  	add_column :vmhosts, :model, :string 
  	add_column :vmhosts, :uuid, :string
  	add_column :vmhosts, :cpu_thread_count, :integer
  	add_column :vmhosts, :cpu_ghz, :float
  	add_column :vmhosts, :cpu, :text
  	add_column :vmhosts, :cpu_usage, :integer
  	add_column :vmhosts, :cpu_usage_percent, :float
  	add_column :vmhosts, :memory_usage, :integer
  	add_column :vmhosts, :memory_free_percent, :float
  	
  end
end




