require 'spec_helper'

describe Score do
  before do
    @score = Score.create(user_id: 1, title: "wario's fat", composer: "Andy Principe", music_xml: File.open(File.expand_path("spec/test_scores/wario.xml")))
  end

  it "should return the score ID for the uploader" do
    expect(@score.user_id).to eq 1
  end

  subject { @score }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:composer) }
  it { should respond_to(:music_xml) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:composer) }
  it { should validate_presence_of(:music_xml) }

  it { should belong_to(:user) }
  it { should have_many(:parts) }
  it { should have_many(:measures).through(:parts) }
  it { should have_many(:notes).through(:measures) }

end
