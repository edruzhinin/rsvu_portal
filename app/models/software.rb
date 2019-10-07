class Software < ActiveRecord::Base
  belongs_to :software_type
  belongs_to :license
  belongs_to :installable, polymorphic: true
  validates_associated :software_type
  accepts_nested_attributes_for :software_type
  accepts_nested_attributes_for :license
  
  
end
