class Vmresourcepool < ActiveRecord::Base
  belongs_to :vmhost
  has_many :vms
end
