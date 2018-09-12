class AddMoreFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :full_name, :string
  	add_column :users, :gender, :string
  	add_column :users, :address_1, :string
  	add_column :users, :address_2, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :country, :string
  	add_column :users, :born_on, :datetime
  end
end
