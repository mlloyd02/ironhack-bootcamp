class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.text :artist
      t.text :venue
      t.text :city
      t.date :date
      t.decimal :price
      t.text :description

      t.timestamps null: false
    end
  end
end
