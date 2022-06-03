class Movie < ApplicationRecord
  has_many_attached :poster_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :favourites, :dependent => :destroy
  has_one :movie_detail, :dependent => :destroy
  validates :title, :price, :category, :poster_img, presence: true
  #validates :category, uniqueness: true

  def self.search(search)
    if search.present?
      @movies = Movie.left_outer_joins(:movie_detail,).where(["movies.title LIKE :search OR movies.category LIKE :search OR movie_details.cast LIKE :search OR movie_details.director LIKE :search " , search: "%#{search}%" ])
      # if @movies
      #   @movie_details = MovieDetail.all.where(["cast LIKE :search OR director LIKE :search ", search: "%#{search}%" ])
      # end
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
  has_many :likes, as: :likeable


end
