require_relative 'journey'
class JourneyLog
  attr_reader :journey_class, :journeys

  def initialize(journey_class=Journey)
    @journeys = []
    @journey_class = journey_class
  end

  def start(station)
    journeys << journey_class.new(station)
    puts "Im in the start method #{journeys}"
  end

  def current_journey
    return journeys[journeys.length-1] if journeys[journeys.length-1] != nil && journeys[journeys.length-1].exitstation == nil
    @journey_class.new()
  end

  def finish(exitstation)
    journeys[journeys.length-1].exit(exitstation)
    puts "Im in the finish method #{journeys}"
  end

  def journ
    @journeys.dup
  end

  def in_journey?
    if  @journeys.last.exitstation == nil
       true
    else
       false
    end
  end

end
