class User < ApplicationRecord

	belongs_to :role 
	before_validation :set_password

	devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

	def full_name
		self.first_name + " " + self.last_name
	end


	private

	def set_password
		self.password = "temporal1"
		self.password_confirmation = "temporal1"
	end

end