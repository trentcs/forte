class Measure < ActiveRecord::Base
  belongs_to :part
  has_one :key
  has_one :clef
  has_one :measure_time
  has_many :notes

  validates :number, :divisions, :part_id, presence: :true

  after_create :create_key, :create_clef, :create_time, :create_notes


  def create_key
    if $hash["score_partwise"]["part"].is_a?(Hash)
      measure_attributes = $hash["score_partwise"]["part"]["measure"][self.number - 1]["attributes"]
    else
      measure_attributes = $hash["score_partwise"]["part"][self.part.part_number - 1]["measure"][self.number - 1]["attributes"]
    end
    

    if measure_attributes && measure_attributes["key"]
      self.key = Key.create(fifths: measure_attributes["key"]["fifths"].to_i, mode: measure_attributes["key"]["mode"])
    else
      sibling = Measure.find(self.id - 1)
      self.key = Key.create(fifths: sibling.key.fifths, mode: sibling.key.mode)
    end
  end

  def create_clef
    if $hash["score_partwise"]["part"].is_a?(Hash)
      measure_attributes = $hash["score_partwise"]["part"]["measure"][self.number - 1]["attributes"]
    else
      measure_attributes = $hash["score_partwise"]["part"][self.part.part_number - 1]["measure"][self.number - 1]["attributes"]
    end

    if measure_attributes && measure_attributes["clef"]
      line = nil
      sign = nil
      if measure_attributes["clef"].is_a?(Array)
        line = measure_attributes["clef"][0]["line"].to_i
        sign = measure_attributes["clef"][0]["sign"]
      else
        line = measure_attributes["clef"]["line"].to_i
        sign = measure_attributes["clef"]["sign"]
      end

      self.clef = Clef.create(line: line, sign: sign)
    else
      sibling = Measure.find(self.id - 1)
      self.clef = Clef.create(line: sibling.clef.line, sign: sibling.clef.sign)
    end
  end

  def create_time
    if $hash["score_partwise"]["part"].is_a?(Hash)
      measure_attributes = $hash["score_partwise"]["part"]["measure"][self.number - 1]["attributes"]
    else
      measure_attributes = $hash["score_partwise"]["part"][self.part.part_number - 1]["measure"][self.number - 1]["attributes"]
    end

    if measure_attributes && measure_attributes["time"]
      self.measure_time = MeasureTime.create(beats: measure_attributes["time"]["beats"].to_i, beat_type: measure_attributes["time"]["beat_type"].to_i)
    else
      sibling = Measure.find(self.id - 1)
      self.measure_time = MeasureTime.create(beats: sibling.measure_time.beats, beat_type: sibling.measure_time.beat_type)
    end
  end

  def create_notes

    if $hash["score_partwise"]["part"].is_a?(Hash)
      notes = $hash["score_partwise"]["part"]["measure"][self.number - 1]["note"]
    else
      notes = $hash["score_partwise"]["part"][self.part.part_number - 1]["measure"][self.number - 1]["note"]
    end
    
    notes = [notes] if notes.is_a?(Hash)


    if notes
      notes.each do |note|
        if note["rest"]==nil && note["pitch"]
          alter =  note["pitch"]["alter"]||0
          sci_notation = note["pitch"]["step"] + note["pitch"]["octave"]
          isrest = false
        else
          alter = nil
          sci_notation = nil
          isrest = true
        end

        self.notes << Note.create(rest: isrest, duration: note["duration"].to_i, voice: note["voice"].to_i, note_type: note["type"], stem: note["stem"], chord: note["chord"]!= nil, alter: alter, sci_notation: sci_notation)
      end
    end
  end
end
