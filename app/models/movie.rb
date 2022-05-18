class Movie < ApplicationRecord
  has_many_attached :poster_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :favourites, :dependent => :destroy
  has_many :movie_details, :dependent => :destroy
end
