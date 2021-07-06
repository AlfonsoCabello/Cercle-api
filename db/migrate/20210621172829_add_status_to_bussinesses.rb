class AddStatusToBussinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :bussinesses, :status, :string
  end
end
