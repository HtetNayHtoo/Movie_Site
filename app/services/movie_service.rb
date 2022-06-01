class MovieService
    class << self
        def initalize
            @movie = MovieRepository.all
        end

        def createMovie(movie)
            @create_movie = MovieRepository.createMovie(movie)
        end

        def getMovieById(id)
            @movie = MovieRepository.getMovieById(id)
        end

        def updateMovie(movie, movie_params, movie_detail_params)
            @update_movie = MovieRepository.updateMovie(movie, movie_params, movie_detail_params)
        end

        def destroyMovie(movie)
            @destroy_movie = MovieRepository.destroyMovie(movie)
        end
    end
end