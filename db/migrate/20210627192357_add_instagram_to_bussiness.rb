class AddInstagramToBussiness < ActiveRecord::Migration[6.1]
  def change
    add_column :bussinesses, :instagram, :string
  end
end
