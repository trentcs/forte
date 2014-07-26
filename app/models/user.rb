class User < ActiveRecord::Base
  has_many :scores
  
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :password, :length => {:minimum => 6, :message => "Password must be at least 6 characters"}
  validates :password_digest, presence: true
  #profile picture using carrierwave
  mount_uploader :user_image_url, ProfilePictureUploader

  #set default image before creating a user
  before_create :set_default_image


  def set_default_image
    self.user_image_url = open('/download.jpeg')
  end

end
