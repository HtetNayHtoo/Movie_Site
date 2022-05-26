class FavouritesController < ApplicationController
    def create
        @favourite = current_user.favourites.new(favourite_params)
        if !@favourite.save 
          flash[:notice] = @favourite.errors.full_messages.to_sentence
        end
        redirect_to movies_path 
    end

    def destroy

      @favourite = current_user.favourites.find(params[:id])
      movie = @favourite.movie 
      @favourite.destroy
      redirect_to movies_path

    end

    private
    def favourite_params
      params.require(:favourite).permit(:movie_id)
    end
end