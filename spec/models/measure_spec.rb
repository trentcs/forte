require 'spec_helper'

describe Measure do
  let (:measure) {Measure.new(number: 23, divisions: 12, part_id: 2)}

  it "should return the measure number for the measure object" do
    expect(measure.number).to eq 23
  end

  it "should return the number of division for the measure object" do
    expect(measure.divisions).to eq 12
  end

  it "should return the measure part_id for the measure object" do
    expect(measure.part_id).to eq 2
  end

  subject { measure }

  it { should respond_to(:number) }
  it { should respond_to(:divisions) }
  it { should respond_to(:part_id) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:divisions) }
  it { should validate_presence_of(:part_id) }

  it { should belong_to(:part) }
  it { should have_one(:key) }
  it { should have_one(:clef) }
  it { should have_one(:measure_time) }
  it { should have_many(:notes) }

end