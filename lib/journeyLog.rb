class JourneyLog
  attr_reader :journey_class, :journeys

  def initialize(journey_class)
    @journeys = []
    @journey_class = journey_class
  end

  def start(station)
    journeys << Journey.new(station)
  end

end
