class JourneyLog
  attr_reader :journey_class, :journeys

  def initialize(journey_class)
    @journeys = []
    @journey_class = journey_class
  end

  def start(station)
    journeys << journey_class.new(station)
  end

  def current_journey
    @journey_class.new()
  end
end
