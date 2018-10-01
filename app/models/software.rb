class Software < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :software_type
end
