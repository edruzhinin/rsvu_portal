class AddInstallableToSoftware < ActiveRecord::Migration
  def change
  	add_reference(:softwares, :installable, polymorphic: true)
  	
  end
end
