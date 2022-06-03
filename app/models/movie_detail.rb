class MovieDetail < ApplicationRecord
    belongs_to :movie , :foreign_key => 'movie_id'
    validates  :desc, :release_date, :trailer_link, :cast, :rotten_tomatoe, :imdb, presence: true
end
