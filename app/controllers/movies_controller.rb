class MoviesController < ApplicationController
  before_action :set_movie, only: %i[  edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
    @favourite_exists = Favourite.where(movie: @movie, user: current_user) == [] ? false : true
    @movies = Movie.where(params[:category])
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movies = Movie.all
    @movie = MovieService.getMovieById(params[:id])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @movies = Movie.all
  end

  # GET /movies/1/edit
  def edit
  end

  def confirm
    @movies = Movie.all
    @movie = Movie.new(movie_params)
    if @movie
      @movie.movie_detail = MovieDetail.new(movie_detail_params)
    end
    #@movie = @movie.movie_detail(movie_detail_params)
    render :new if @movie.invalid?
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)
    @create_movie = MovieService.createMovie(@movie)
    
    respond_to do |format|
      if @create_movie
          @movie.create_movie_detail(movie_detail_params)
          format.html { redirect_to movies_path(@movie), notice: "Movie was successfully created." }
          format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    @update_movie = MovieService.updateMovie(@movie, movie_params)
    respond_to do |format|
      if @update_movie
        @movie.movie_detail.update(movie_detail_params)
        format.html { redirect_to movies_path(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @destroy_movie = MovieService.destroyMovie(@movie)

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :price, :category, poster_img: [])
    end

    def movie_detail_params
      params.require(:movie).permit(:desc, :release_date, :director, :trailer_link, :cast, :rotten_tomatoe, :imdb)
    end
end
