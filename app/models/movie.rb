class Movie < ApplicationRecord
  has_many_attached :poster_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :favourites, :dependent => :destroy
  has_one :movie_detail, :dependent => :destroy
  #validates :title, :price, :category, :poster_img, :desc, :release_date, :trailer_link, :cast, :rotten_tomatoe, :imdb, presence: true


  def self.search(search)
    if search.present?
      @movies = Movie.all.where(["title LIKE ? OR category LIKE ? ", "%#{search}%", "%#{search}%"])
      # @movies = MovieDetail.all.where(["cast LIKE ? OR director LIKE ? ", "%#{search}%", "%#{search}%"])
        # @users = User.where(["username LIKE ? OR address LIKE ?
        #   OR usertype LIKE ? OR email LIKE ? OR birthday LIKE ? 
        #   OR ph LIKE ?", "%#{search}%"]
    else
       @movies = Movie.all
    end
  end

  def self.category(cate)
    if cate.present?
      @movies = Movie.all.where(["category LIKE ?", "%#{cate}%"])
    else
      @movies = Movie.all
    end
  end
end
