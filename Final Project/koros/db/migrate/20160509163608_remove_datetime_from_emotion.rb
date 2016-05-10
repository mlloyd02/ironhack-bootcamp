class RemoveDatetimeFromEmotion < ActiveRecord::Migration
  def change
    remove_column :emotions, :datetime, :datetime
  end
end
