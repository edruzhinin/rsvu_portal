class VmAddArchiveReference < ActiveRecord::Migration
  def change
  	add_reference :vms, :archive, foreign_key: true
  end
end
