require 'journeyLog'

describe JourneyLog do
  it "it stores a journey class" do
    journeyLog = JourneyLog(Journey)
    expect(journeyLog.journey_class).to eq(Journey)
  end
end
