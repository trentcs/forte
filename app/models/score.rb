require "rexml/document"
require "active_support/core_ext"

class Score < ActiveRecord::Base
  belongs_to :user
  has_many :parts
  has_many :measures, through: :parts
  has_many :notes, through: :measures

  mount_uploader :music_xml, OriginalScorePhotoUploader

  after_create :create_parts

  def create_parts
    music_xml_file = open("public/#{self.music_xml.url}")
    $hash = Hash.from_xml(File.read(music_xml_file))

    parts = $hash["score_partwise"]["part_list"]["score_part"]
    parts = [parts] if parts.is_a?(Hash)
    # puts "parts is #{parts}"

    parts.each do |part|
      puts "part is #{part}"
      self.parts << Part.create(instrument_name: part["part_name"], part_number: part["id"][1..-1].to_i)
    end
  end

end

