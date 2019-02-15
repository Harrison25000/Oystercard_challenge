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

  it "adds exit station to current journey when it finishes" do
    journeyLog = JourneyLog.new(Journey)
    journeyLog.start("Paddington")
    journeyLog.finish("Kings X")
    expect(journeyLog.journeys[0]).to have_attributes(:entrystation => "Paddington", :exitstation => "Kings X")
  end

  it "Shows a duplicated version of journeys" do
    station_double = double :station
    journey_double = double :journey, exit: station_double
    journey_class_double = double :journey_class, new: journey_double
    journeyLog = JourneyLog.new(journey_class_double)
    journeyLog.start(station_double)
    journeyLog.finish(station_double)
    expect(journeyLog.journeys).not_to equal(journeyLog.journ)
  end

  it "Shows the same content of journeys" do
    station_double = double :station
    journey_double = double :journey, exit: station_double
    journey_class_double = double :journey_class, new: journey_double
    journeyLog = JourneyLog.new(journey_class_double)
    journeyLog.start(station_double)
    journeyLog.finish(station_double)
    expect(journeyLog.journeys).to eq(journeyLog.journ)
  end

  it "Is on journey" do
    journey_double = double :journey, entrystation: "bob", exitstation: nil
    journey_class_double = double :JL, new: journey_double
    station = double :station
    journeyl = JourneyLog.new(journey_class_double)
    journeyl.start(station)
    expect(journeyl.in_journey?).to eq true
  end

  it "Is not on a journey" do
    station = double :station
    journey_double = double :journey, entrystation: "bob", exitstation: "nil", exit: station
    journey_class_double = double :JL, new: journey_double
    journeyl = JourneyLog.new(journey_class_double)
    journeyl.start(station)
    journeyl.finish(station)
    expect(journeyl.in_journey?).to eq false
  end
end
