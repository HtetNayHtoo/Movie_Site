class RemoveMovieDetailFromComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :movie_detail_id, :integer
  end
end
