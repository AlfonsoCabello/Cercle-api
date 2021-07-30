class User < ApplicationRecord

	belongs_to :role 
	belongs_to :team, optional: true
	before_create :set_password
	after_create :send_welcome_email

	#################SCOPES

	scope :unassigned, ->() {where(team_id:nil, role_id:2)} 
	scope :mine, ->(team_id) {where(team_id: team_id)} 	

	#################

	devise :database_authenticatable, :registerable, :recoverable, :rememberable
	#:trackable, :validatable, :confirmable

	def full_name
		self.first_name + " " + self.last_name
	end

	private

	def set_password
		if self.password.nil?
			require 'securerandom'
			new_password = SecureRandom.hex
			self.password = new_password
			self.password_confirmation = new_password
		end
	end

	def send_welcome_email
		#We call method welcome
		UserMailer.with(user: self, new_password: self.password).welcome.deliver_later
	end	

end