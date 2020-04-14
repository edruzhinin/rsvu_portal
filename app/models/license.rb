class License < ActiveRecord::Base
	has_many :softwares
	belongs_to :software_type
end
