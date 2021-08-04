class ChangeInterestedToBussinesses < ActiveRecord::Migration[6.1]
  def change
    change_column :bussinesses, :interested, :integer, using: "interested::integer"
  end
end
