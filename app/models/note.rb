class Note < ActiveRecord::Base
  belongs_to :measure

  validates :duration, :voice, :measure_id, presence: :true

end