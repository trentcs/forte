class User < ActiveRecord::Base
  has_many :scores
  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password_digest, presence: true
  #profile picture using carrierwave
  mount_uploader :user_image_url, ProfilePictureUploader

end
