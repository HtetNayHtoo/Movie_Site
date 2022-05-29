class RemoveFkFromLikesToMovie < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :likes , :movies
  end
end
