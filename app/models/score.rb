require "rexml/document"

class Score < ActiveRecord::Base
  belongs_to :user
  has_many :parts
  has_many :measures, through: :parts
  has_many :notes, through: :measures

  mount_uploader :music_xml, OriginalScorePhotoUploader

  before_create :create_parts

  def create_parts
    music_xml_file = open(self.music_xml)
    $doc = REXML::Document.new music_xml_file

    score_parts = $doc.elements.to_a("//score-part")
    score_parts.each do |score_part, index|
      self.parts << Part.create(instrument_name: score_part.elements.to_a("//instrument-name")[0].text)
    end
  end

end
