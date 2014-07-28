class Part < ActiveRecord::Base
  belongs_to :score
  has_many :measures
  has_many :notes, through: :measures
end
