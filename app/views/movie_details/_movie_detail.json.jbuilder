json.extract! movie_detail, :id, :release_date, :director, :trailer_link, :cast, :rotten_tomatoe, :imdb, :created_at, :updated_at
json.url movie_detail_url(movie_detail, format: :json)
