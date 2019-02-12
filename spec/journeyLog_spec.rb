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

  it "returns a new journey if there is no current journey" do
    journeyLog = JourneyLog.new(Journey)
    expect(journeyLog.current_journey).to have_attributes(:entrystation => nil, :exitstation => nil)
    # a kind of Journey with nil entry and exit stations
  end

  it "returns incomplete journey if in progress" do
  journeyLog = JourneyLog.new(Journey)
  journeyLog.start("Paddington")
  expect(journeyLog.current_journey).to have_attributes(:entrystation => "Paddington", :exitstation => nil)
  end
end
