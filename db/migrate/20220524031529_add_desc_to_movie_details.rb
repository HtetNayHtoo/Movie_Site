class AddDescToMovieDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :movie_details, :desc, :string
  end
end
