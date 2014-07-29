require 'spec_helper'

describe Clef do
  before do
    @clef = Clef.new(sign: "G", line: 2, measure_id: 2)
  end

  it "should return the sign for the clef" do
    expect(@clef.sign).to eq "G"
  end

  it "should return the line for the clef" do
    expect(@clef.line).to eq 2
  end

  it "should return the measure_id for the clef" do
    expect(@clef.measure_id).to eq 2
  end

  subject { @clef }

  it { should respond_to(:sign) }
  it { should respond_to(:line) }
  it { should respond_to(:measure_id) }

  it { should validate_presence_of(:sign) }
  it { should validate_presence_of(:line) }
  it { should validate_presence_of(:measure_id) }

  it { should belong_to(:measure) }

end
