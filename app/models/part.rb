class Part < ActiveRecord::Base
  belongs_to :score
  has_many :measures
  has_many :notes, through: :measures
  validates :score_id, :instrument_name, :part_number, presence: :true
  after_create :create_measures


  def create_measures
    if ScoreHash.hash["score_partwise"]["part"].is_a?(Hash)
      measures = ScoreHash.hash["score_partwise"]["part"]["measure"]
    else
      measures = ScoreHash.hash["score_partwise"]["part"][part_number - 1]["measure"]
    end
    
    measures = [measures] if measures.is_a?(Hash)
    divisions = nil

    measures.each do |measure|

      unless measure["attributes"].nil?
        unless measure["attributes"]["divisions"].nil?
          divisions = measure["attributes"]["divisions"].to_i
        end
      end

      self.measures << Measure.create(number: measure["number"].to_i, divisions: divisions, part_id: self.id)
    end
  end

end
