class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password,presence: true, :length => { :minimum => 6}
  has_one_attached :profile_img
  has_many :comments, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :favourites,:dependent => :destroy
  has_many :likes, :dependent => :destroy
  after_commit :add_default_avatar, on: %i[create update]


    def add_default_avatar
      unless profile_img.attached?
        profile_img.attach(
          io: File.open(
            Rails.root.join(
              'app', 'assets', 'images', 'default_profile.jpg'
            )
          ), filename: 'default_profile.jpg',
          content_type: ['image/png', 'image/jpeg']
        )
      end
      
    end
end
