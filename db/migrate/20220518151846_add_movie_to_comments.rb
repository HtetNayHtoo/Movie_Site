class AddMovieToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :movie, null: false, foreign_key: true
  end
end
