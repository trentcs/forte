class MeasureTime < ActiveRecord::Base
  belongs_to :measure

  validates :beats, :beat_type, :measure_id, presence: :true

end