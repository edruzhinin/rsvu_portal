class HardwareMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :hardware
end
