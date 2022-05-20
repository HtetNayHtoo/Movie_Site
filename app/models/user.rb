class User < ApplicationRecord
  has_many_attached :profile_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_one :favourite
end
