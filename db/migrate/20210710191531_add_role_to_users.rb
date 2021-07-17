class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    #1 to many
    #Plural (first), second singular
    add_reference :users, :role
  end
end
