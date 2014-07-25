class Score < ActiveRecord::Base
  belongs_to :user
  mount_uploader :original_image, OriginalScorePhotoUploader
end
