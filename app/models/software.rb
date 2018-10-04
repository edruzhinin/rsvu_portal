class Software < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :software_type
  validates_associated :software_type
  accepts_nested_attributes_for :software_type
end
