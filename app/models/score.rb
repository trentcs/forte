require "rexml/document"

class Score < ActiveRecord::Base
  belongs_to :user
  has_many :parts
  has_many :measures, through: :parts
  has_many :notes, through: :measures

  mount_uploader :music_xml, OriginalScorePhotoUploader

  def self.search(search)
    @scores = where('title LIKE ? OR composer LIKE ? ', "%#{search}%", "%#{search}%")
  end

  # before_create :create_parts

  # def create_parts
  #   puts "SELFMUSIC XML #{self.music_xml}"
  #   music_xml_file = open("#{self.music_xml}")
  #   $doc = REXML::Document.new music_xml_file

  #   score_parts = $doc.elements.to_a("//score-part")
  #   score_parts.each do |score_part, index|
  #     self.parts << Part.create(instrument_name: score_part.elements.to_a("//instrument-name")[0].text)
  #   end
  # end

end
