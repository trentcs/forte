class Note < ActiveRecord::Base
  belongs_to :measure
  has_one :pitch
end
