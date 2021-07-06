class AddAttributesToBussiness < ActiveRecord::Migration[6.1]
  def change
    add_column :bussinesses, :site_web, :string
    add_column :bussinesses, :chatbot, :boolean
    add_column :bussinesses, :system_price, :boolean
    add_column :bussinesses, :newsletter, :boolean
    add_column :bussinesses, :trans_site, :boolean
    add_column :bussinesses, :delivery, :boolean
    add_column :bussinesses, :email, :string
    add_column :bussinesses, :comments, :text
  end
end
