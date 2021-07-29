# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.find_or_create_by(name: 'admin')
Role.find_or_create_by(name: 'intern')
User.create(email: 'alfonso.cabelloluna@gmail.com', first_name: 'Alfonso', last_name: 'Cabello', password: 'temporal1', password_confirmation: 'temporal1', phone: '00000000', role: Role.find_by_name('admin'))
