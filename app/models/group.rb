class Group < ActiveRecord::Base
	has_many :group_relations
	
	belongs_to :user

	validates :short_name, length: { maximum: 15 }
end
