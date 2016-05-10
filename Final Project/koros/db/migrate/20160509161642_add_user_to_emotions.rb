class AddUserToEmotions < ActiveRecord::Migration
  def change
    add_reference :emotions, :user, index: true, foreign_key: true
  end
end
