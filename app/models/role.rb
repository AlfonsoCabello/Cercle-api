class Role < ApplicationRecord

	#Scope
	scope :admin, ->() {find_by(name: "admin")} 

	#Relantionship
	has_many :users
end
