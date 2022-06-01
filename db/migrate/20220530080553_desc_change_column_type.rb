class DescChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column(:movie_details, :desc, :text)
  end
end
