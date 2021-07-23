class AddPhoneToBusiness < ActiveRecord::Migration[6.1]
  def change
    add_column :bussinesses, :phone, :integer
  end
end
