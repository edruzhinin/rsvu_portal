class GroupRelation < ActiveRecord::Base
  belongs_to :group
  belongs_to :groupable, polymorphic: true
  
end
