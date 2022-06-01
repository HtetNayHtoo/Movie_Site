class MovieRepository
    class << self
        def initalize
            @movie = Movie.all
        end

        def createMovie(movie)
            @create_movie = movie.save
        end

        def getMovieById(id)
            @movie = Movie.find(id)
        end

        def updateMovie(movie, movie_params, movie_detail_params)
            @update_movie = movie.update(movie_params)
            if @update_movie
                @movie.movie_detail.update(movie_detail_params) 
            end
        end

        def destroyMovie(movie)
            @destroy_movie = movie.destroy
        end
    end
end
