class Key < ActiveRecord::Base
  belongs_to :measure

  validates :fifths, :mode, :measure_id, presence: :true

end

