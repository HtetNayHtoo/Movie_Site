class FavouritesController < ApplicationController
    def create
      @movie = Movie.find(params[:movie_id])
      if @movie.user_id != current_user.id   #You can register favorites other than your own posts
        @favourite = Favorite.create(user_id: current_user.id, movie_id: @movie.id)
      end
    end
    def destroy
      @movie = Movie.find(params[:movie_id])
      @favourite = Favorite.find_by(user_id: current_user.id, movie_id: @movie.id)
      @favourite.destroy
    end
  end