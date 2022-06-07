class ApplicationController < ActionController::Base
  before_action :set_no_cache
  before_action :movie
  
  helper_method :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end

  helper_method :movie
    def movie
      @movies = Movie.all
    end 

  # movie method bug fix 2
    helper_method :current_movie
    def current_movie
      if params[:movie_id]
        @current_movie ||= Movie.find(params[:movie_id])
      else
        @current_movie = nil
      end
    end

  def set_no_cache
    response.headers['Cache-Control'] = 'no-cache, no-store,
                                        max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  def require_user_login
    render status: 500 if current_user.nil?
  end
end
