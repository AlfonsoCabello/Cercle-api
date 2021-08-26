class ChangePhoneToBussiness < ActiveRecord::Migration[6.1]
  def change
        change_column :bussinesses, :phone, :string
  end
end
