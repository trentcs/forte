require 'spec_helper'

describe Score do
	let(:music_xml_1) do
		File.open("spec/test_scores/wario.xml")
	end

  let(:score) do
  	score = Score.create!(user_id: 1, 
  							 title: "wario's fat",
  							 composer: "Andy Principe",
  							 music_xml: music_xml_1)
  end

 	let(:music_xml_2) do
		File.open("spec/test_scores/africa.xml")
	end

  let(:score2) do
  	score2 = Score.create!(user_id: 1, 
  							 title: "Africa",
  							 composer: "Al Pachino",
  							 music_xml: music_xml_2)
  end

	# before(:each) do
	# 	@music_xml = File.open("spec/test_scores/wario.xml")
	# 	@score = Score.create!(user_id: 1, 
 #  							  title: "wario's fat",
 #  							  composer: "Andy Principe",
 #  							  music_xml: @music_xml)
	# end

	# after(:each) do
	# 	@music_xml.close
	# end

  subject { score }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:composer) }
  it { should respond_to(:music_xml) }

  # it { should validate_presence_of(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:composer) }


  it { should belong_to(:user) }
  it { should have_many(:parts) }
  it { should have_many(:measures).through(:parts) }
  it { should have_many(:notes).through(:measures) }

  it "should return the score ID for the uploader" do
    expect(score.user_id).to eq 1
  end

  it "should return the score title " do
    expect(score.title).to eq "wario's fat"
  end

  it "should return the score composer" do
    expect(score.composer).to eq "Andy Principe"
  end

  xit "should create parts" do
  	score
  	before = Part.all.count
  	score.create_parts
  	after = Part.all.count
  	# p before
  	# p after
  	# File.close("spec/test_scores/wario.xml")
  	expect(after > before).to be_true
  end 

  it "should return the number of total notes in the score" do
  	score.total_note_count
  	expect(score.total_note_count).to eq(31)
  end

  it "should return search results for the score" do
  	score
  	expect(Score.search("wario").first.title).to eq("wario's fat")
  end

  it "should return search results for the composer" do
  	score
  	expect(Score.search("Andy").first.composer).to eq("Andy Principe")
  end 

  it "should return average notes per a measure metric agaist a particular score" do
  	expect(score.avg_notes_per_measure).to eq(3.88)
  end 

  it "should return average total notes metric against all scores" do
  	score
  	expect(Score.avg_total_note_count).to eq(31.0)
  end

  it "should return average notes per a measure metric against all scores" do
  	score
  	expect(Score.avg_notes_per_measure).to eq(3.88)
  end

  it "should return the range of the score" do
  	expect(score.get_range).to eq(["wario's fat", 172.0])
  end

  it "should return the range of all scores" do
  	score
  	expect(Score.get_ranges).to eq([["wario's fat", 172.0]])
  end

  it "should return the frequencies from the score" do
    expect(score.get_frequencies).to eq([["Part 1: Violin", 293.66, 293.66, 293.66, 392.0, 293.66, 293.66, 293.66, 220.0, 293.66, 293.66, 293.66, 392.0, 329.63, 293.66, 293.66, 293.66, 220.0], ["Part 1: Violin x", 0, 2, 4, 8, 10, 12, 16, 18, 20, 24, 28, 32, 34, 36, 40, 44, 48, 52, 55, 56], ["Part 2: Violin", 293.66, 329.63, 293.66, 329.63, 293.66, 329.63, 293.66, 220.0], ["Part 2: Violin x", 0, 8, 12, 16, 24, 28, 32, 40, 44, 48, 56]])
  end

  it "should return the position of the note in a score" do
    note = score.notes.first
    part = score.parts.first
    expect(score.position_in_score(note, part)).to eq(0)
  end

  it "should return the duration count for a note in the score" do
    expect(score.get_duration_counts).to eq([["eighth", 9], ["quarter", 15], ["16th", 1], ["half", 6]])
  end

  it "should return the scientific notation based on a frequency" do
    expect(score.sci_to_freq("c4")).to eq(261.63)
  end
end
