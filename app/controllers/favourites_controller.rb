class FavouritesController < ApplicationController
    def create

      favourite = Favourite.where(movie: Movie.find(params[:movie]), user: current_user)
      if favourite == []
            # Create the fav
            @favourite = Favorite.create(user_id: current_user.id, movie_id: @movie.id)
            @favourite_exists = true
      else
           # Delete the fav
           favourite.destroy_all
           @favourite_exists = false
      end

      respond_to do |format|
        format.html {}
        format.js {}


      # @movie = Movie.find(params[:movie_id])
      # if @movie.user_id != current_user.id   #You can register favorites other than your own posts
      #   @favourite = Favourite.create(user_id: current_user.id, movie_id: @movie.id)
      # end
    end

    def destroy

      # @movie = Movie.find(params[:movie_id])
      # @favourite = Favourite.find_by(user_id: current_user.id, movie_id: @movie.id)
      # @favourite.destroy

    end
  end