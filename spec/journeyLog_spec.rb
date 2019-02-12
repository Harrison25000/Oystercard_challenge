require 'journeyLog'

describe JourneyLog do
  it "it stores a journey class" do
    journeyLog = JourneyLog.new(Journey)
    expect(journeyLog.journey_class).to eq(Journey)
  end

  it "Starts a journey with an entry station" do
    journeyLog = JourneyLog.new(Journey)
    journeyLog.start("Paddington")
    expect(journeyLog.journeys).to include(a_kind_of(Journey))

  end
end
