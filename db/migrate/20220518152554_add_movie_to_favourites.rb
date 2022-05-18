class AddMovieToFavourites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favourites, :movie, null: false, foreign_key: true
  end
end
