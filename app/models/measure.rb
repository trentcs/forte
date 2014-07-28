class Measure < ActiveRecord::Base
  belongs_to :part
  has_one :key
  has_one :clef
  has_one :measure_time
  has_many :notes
end
