class AddOfficeToBussinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :bussinesses, :office, :integer
  end
end
