class Team < ApplicationRecord
	
############ Relationships

	has_many :bussinesses
	has_many :users

############ Validations

	validate :check_availability

private

def check_availability
	errors.add(:bussinesses, "No available businesses") if self.bussinesses.empty?
	errors.add(:users, "No available users") if self.users.empty?
end

end


