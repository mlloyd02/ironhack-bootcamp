class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.float :valence
      t.float :arousal
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
