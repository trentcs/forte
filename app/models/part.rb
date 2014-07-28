class Part < ActiveRecord::Base
  belongs_to :score
  has_many :measures
  has_many :notes, through: :measures
  before_create :create_measures


  def create_measures
    # NOT YET WORKING
    # part = doc.root.elements["part[@id='P#{self.id}']"]


    # measures = $doc.elements.to_a("//part")
    # measures.each do |measure|
    #   Measure.create(SOME SHIT)
    # end
  end

end
