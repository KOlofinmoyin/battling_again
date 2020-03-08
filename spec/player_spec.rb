require 'player'

describe Player do
  subject { described_class.new("Dave") }
  
  it "returns its name" do
    expect(subject.name).to eq 'Dave'
  end
end
