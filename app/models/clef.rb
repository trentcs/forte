class Clef < ActiveRecord::Base
  belongs_to :measure

  validates :sign, :line, :measure_id, presence: :true

end