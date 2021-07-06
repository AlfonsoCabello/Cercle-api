class CreateBussinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :bussinesses do |t|
      t.string :name
      t.string :street
      t.string :zipcode
      t.string :neighborhood
      t.boolean :interested

      t.timestamps
    end
  end
end
