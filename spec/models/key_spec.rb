require 'spec_helper'

describe Key do
  before do
    @key = Key.new(fifths: 0, mode: "major", measure_id: 2)
  end

  it "should return the fifths for the key" do
    expect(@key.fifths).to eq 0
  end

  it "should return the mode for the key" do
    expect(@key.mode).to eq "major"
  end

  it "should return the measure_id for the key" do
    expect(@key.measure_id).to eq 2
  end

  subject { @key }

  it { should respond_to(:fifths) }
  it { should respond_to(:mode) }
  it { should respond_to(:measure_id) }

  it { should validate_presence_of(:fifths) }
  it { should validate_presence_of(:mode) }
  it { should validate_presence_of(:measure_id) }

  it { should belong_to(:measure) }

end