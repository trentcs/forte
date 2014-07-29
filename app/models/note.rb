class Note < ActiveRecord::Base
  belongs_to :measure

  validates :rest, :duration, :chord, :voice, :measure_id, presence: :true

end