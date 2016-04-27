class AddMissingColumns < ActiveRecord::Migration
  def change
  	add_column :contacts, :address, :string
  	add_column :contacts, :phone_number, :integer
  	add_column :contacts, :email, :string
  end
end
