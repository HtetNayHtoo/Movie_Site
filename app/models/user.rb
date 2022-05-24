class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many_attached :profile_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :favourites
end
