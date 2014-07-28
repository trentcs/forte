class Score < ActiveRecord::Base
  belongs_to :user
  has_many :parts
  has_many :measures, through: :parts
  has_many :notes, through: :measures
  mount_uploader :music_xml, OriginalScorePhotoUploader
end
