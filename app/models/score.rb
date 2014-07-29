require "rexml/document"
require "active_support/core_ext"

class Score < ActiveRecord::Base
  belongs_to :user
  has_many :parts
  has_many :measures, through: :parts
  has_many :notes, through: :measures

  validates :user_id, :title, :composer, :music_xml, presence: :true

  mount_uploader :music_xml, OriginalScorePhotoUploader


  def self.search(search)
    @scores = where('title LIKE ? OR composer LIKE ? ', "%#{search}%", "%#{search}%")
  end


  after_create :create_parts

  def avg_notes_per_measure
    total_notes = self.notes.count
    total_measures = self.measures.count
    (total_notes / total_measures.to_f).round(2)
  end


  def create_parts
    music_xml.cache_stored_file!
    $hash = Hash.from_xml(music_xml.file.read)

    parts = $hash["score_partwise"]["part_list"]["score_part"]
    parts = [parts] if parts.is_a?(Hash)

    parts.each do |part|
      self.parts << Part.create(instrument_name: part["part_name"], part_number: part["id"][1..-1].to_i)
    end
  end

end

