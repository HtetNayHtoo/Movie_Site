class ApplicationController < ActionController::Base

  helper_method :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end

    helper_method :current_movie
    def current_movie
      if params[:movie_id]
        @current_movie ||= Movie.find(params[:movie_id])
      else
        @current_movie = nil
      end
    end

end
