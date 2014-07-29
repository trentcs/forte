require 'spec_helper'

describe MeasureTime do
  before do
    @measure_time = MeasureTime.new(beats: 4, beat_type: 4, measure_id: 2)
  end

  it "should return the beats for the measure_time" do
    expect(@measure_time.beats).to eq 4
  end

  it "should return the beat_type for the measure_time" do
    expect(@measure_time.beat_type).to eq 4
  end

  it "should return the measure_id for the measure_time" do
    expect(@measure_time.measure_id).to eq 2
  end

  subject { @measure_time }

  it { should respond_to(:beats) }
  it { should respond_to(:beat_type) }
  it { should respond_to(:measure_id) }

  it { should validate_presence_of(:beats) }
  it { should validate_presence_of(:beat_type) }
  it { should validate_presence_of(:measure_id) }

  it { should belong_to(:measure) }

end