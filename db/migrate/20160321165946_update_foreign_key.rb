class UpdateForeignKey < ActiveRecord::Migration[6.1]
    def change
      # remove the old foreign_key
      remove_reference :comments, :movie_details,index: true,foreign_key: true
  end
end