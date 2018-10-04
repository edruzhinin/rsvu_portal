class User < ActiveRecord::Base
	has_many :hardware_reservations
	has_many :hardwares, through: :hardware_reservations
	has_many :hardware_messages
	before_save { self.email = email.downcase}
	before_create :create_remember_token
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates 	:login,	presence: true, uniqueness: { case_sensitive: false }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	
	
	has_secure_password
	validates :password, length: { minimum: 6 }
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
