class ApplicationController < ActionController::Base

  helper_method :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end

  def favorite_text
    return @favourite_exists ? "Unfavorite" : "Favorite"
  end

  helper_method :favorite_text

end
