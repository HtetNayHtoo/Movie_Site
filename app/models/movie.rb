class Movie < ApplicationRecord
  has_many_attached :poster_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :favourites, :dependent => :destroy
  has_one :movie_detail, :dependent => :destroy
  #validates :title, :price, :category, :poster_img, :desc, :release_date, :trailer_link, :cast, :rotten_tomatoe, :imdb, presence: true
end
