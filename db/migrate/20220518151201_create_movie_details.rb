class CreateMovieDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_details do |t|
      t.datetime :release_date
      t.string :director
      t.string :trailer_link
      t.string :cast
      t.string :rotten_tomatoe
      t.float :imdb

      t.timestamps
    end
  end
end
