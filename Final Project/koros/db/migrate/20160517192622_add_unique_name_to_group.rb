class AddUniqueNameToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :unique_name, :string
  end
end
