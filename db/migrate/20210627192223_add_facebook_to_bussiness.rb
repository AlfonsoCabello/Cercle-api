class AddFacebookToBussiness < ActiveRecord::Migration[6.1]
  def change
    add_column :bussinesses, :facebook, :string
  end
end
