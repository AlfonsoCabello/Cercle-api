class User < ApplicationRecord

	belongs_to :role 
	belongs_to :team, optional: true
	before_validation :set_password

	#################SCOPES

	scope :unassigned, ->() {where(team_id:nil, role_id:2)} 
	scope :mine, ->(team_id) {where(team_id: team_id)} 	

	#################

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