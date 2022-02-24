class VmSnapshot < ActiveRecord::Base
  belongs_to :vm
  belongs_to :VmSnapshot
end
