class ScoreHash
	@@score_hash = ""

  def self.hash=(hash)
    @@score_hash = hash
  end

  def self.hash
    @@score_hash
  end
end