class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password,presence: true, :length => { :minimum => 6}
  has_one_attached :profile_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :favourites
  has_many :likes, :dependent => :destroy
end
