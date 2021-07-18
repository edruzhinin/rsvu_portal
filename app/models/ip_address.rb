class IpAddress < ActiveRecord::Base
  belongs_to :mac_address
end
