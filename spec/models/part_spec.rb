require 'spec_helper'

describe Part do
  let (:part1) {Part.new(score_id: 1, instrument_name: "violin", part_number: 1)}
  let (:part2) {Part.new(score_id: 2, instrument_name: "viola", part_number: 2)}

  it "should return the part number for score 1" do
    expect(part1.part_number).to eq 1
  end

  it "should return the part number for score 2" do
    expect(part2.part_number).to eq 2
  end

  subject { part1 }

  it { should respond_to(:score_id) }
  it { should respond_to(:instrument_name) }
  it { should respond_to(:part_number) }

  it { should validate_presence_of(:score_id) }
  it { should validate_presence_of(:instrument_name) }
  it { should validate_presence_of(:part_number) }

  it { should belong_to(:score) }
  it { should have_many(:measures) }
  it { should have_many(:notes).through(:measures) }

end
