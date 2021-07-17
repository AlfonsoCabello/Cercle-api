require 'csv'

class Bussiness < ApplicationRecord

	#################Associations

	belongs_to :team

	#################Validations

	#Forzar poner el nombre del negocio
	validates :name, presence:true
	#Street must have at least 5 characters to be valid
	validates :street, length: {minimum: 5}

	################TRIGGERS - INTERNAL USE COLUMNS

	#Poner estatus de creado en BD despues de crear un registro
	after_create :set_status

	#Poner registros como nulos
	before_create :set_nulls


	#################SCOPES

	#Scope sin parametros
	#scope :all_created, ->() {where(status:"created")} 

	#scope con parametros
	#1 status; nombre attributo 2: nombre variable 
	#scope :by_status, ->(status) {where(status:status)} 

	scope :unassigned, ->() {where(team_id:nil)} 
	scope :mine, ->(team_id) {where(team_id: team_id)} 	

	################ METODOS DE INSTANCIA - EJEMPLO DE METODOS DE INSTANCIA
	#Metodo que solo afectara a la instancia (variables temporales)

	#Como diferenciar entre SELF y no
	#self se refiere 

	def welcome_message
		puts "Welcome/Bienvenue " + self.name
	end

	private
	#Private para que no sea accesado por otro modulo, solo el modelo manda llamar lo que esta adentro
	 
	 def set_status
	 	#establecer status en BD
	 	self.status = "created"
	 	self.save #para que se guarde
	 end

	 #
	 def set_nulls
	 	self.instagram = nil if self.instagram.blank?
	 	self.facebook = nil if self.facebook.blank?
	 	self.email = nil if self.email.blank?
	 	self.site_web = nil if self.site_web.blank?
	 end


	################ METODOS DE CLASE
	#Metodos de clase son aquellos que no solo afectan a una sola instancia

	##### DATA IMPORT

	def self.import(file)
		CSV.foreach(file.path, headers: false) do |row|
			Bussiness.find_or_create_by name: row[0],
			 street: row[1], zipcode: row[2],
			 neighborhood: row[3],
			 interested: row[4]
		end
	end



 
end
