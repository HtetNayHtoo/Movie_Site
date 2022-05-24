class MovieDetailsController < ApplicationController
  before_action :set_movie_detail, only: %i[ show edit update destroy ]

  # GET /movie_details or /movie_details.json
  def index
    @movie_details = MovieDetail.all
  end

  # GET /movie_details/1 or /movie_details/1.json
  def show
    @movie_detail = MovieDetail.find(params[:movie_id])
  end

  # GET /movie_details/new
  def new
    @movie_detail = MovieDetail.new
  end

  # GET /movie_details/1/edit
  def edit
  end

  # POST /movie_details or /movie_details.json
  def create
    @movie_detail = MovieDetail.new(movie_detail_params)
   

    respond_to do |format|
      if @movie_detail.save
        format.html { redirect_to movie_detail_url(@movie_detail), notice: "Movie detail was successfully created." }
        format.json { render :show, status: :created, location: @movie_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_details/1 or /movie_details/1.json
  def update
    respond_to do |format|
      if @movie_detail.update(movie_detail_params)
        format.html { redirect_to movie_detail_url(@movie_detail), notice: "Movie detail was successfully updated." }
        format.json { render :show, status: :ok, location: @movie_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_details/1 or /movie_details/1.json
  def destroy
    @movie_detail.destroy

    respond_to do |format|
      format.html { redirect_to movie_details_url, notice: "Movie detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_detail
      @movie_detail = MovieDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_detail_params
      params.require(:movie_detail).permit(:desc, :release_date, :director, :trailer_link, :cast, :rotten_tomatoe, :imdb)
    end
end
