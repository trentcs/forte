require 'spec_helper'

describe Note do
  before do
    @note = Note.new(rest: false, duration: 2, note_type: "eighth" , stem: "up", chord: false, voice: 1, alter: 0, sci_notation: "C4", measure_id: 2)
    @rest = Note.new(rest: true, duration: 48, chord: false, voice: 1, measure_id: 3)    
  end

  it "should return rest:false for note" do
    expect(@note.rest).to be_false
  end

  it "should return rest:true for rest" do
    expect(@rest.rest).to be_true
  end

  it "should return the sci_notation for the note" do
    expect(@note.sci_notation).to eq "C4"
  end

  subject { @note }

  it { should respond_to(:rest) }
  it { should respond_to(:duration) }
  it { should respond_to(:note_type) }
  it { should respond_to(:stem) }
  it { should respond_to(:chord) }
  it { should respond_to(:voice) }
  it { should respond_to(:alter) }
  it { should respond_to(:sci_notation) }
  it { should respond_to(:measure_id) }

  subject { @rest }

  it { should respond_to(:rest) }
  it { should respond_to(:duration) }
  it { should respond_to(:chord) }
  it { should respond_to(:voice) }
  it { should respond_to(:measure_id) }

  it { should validate_presence_of(:rest) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:chord) }
  it { should validate_presence_of(:voice) }
  it { should validate_presence_of(:measure_id) }

   it { should belong_to(:measure) }

end