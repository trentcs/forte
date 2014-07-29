require 'spec_helper'

describe Score do
	let(:music_xml) do
		File.open("spec/test_scores/wario.xml")
	end

  let(:score) do
  	Score.create!(user_id: 1, 
  							 title: "wario's fat",
  							 composer: "Andy Principe",
  							 music_xml: music_xml)
  end

  subject { score }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:composer) }
  it { should respond_to(:music_xml) }

  it { should validate_presence_of(:user) }
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
  	expect(after > before).to be_true
  end 

  it "should return the number of total notes in the score" do
  	score.total_note_count
  	expect(score.total_note_count).to eq(31)
  end

end
