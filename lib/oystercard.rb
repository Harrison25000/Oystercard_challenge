require_relative 'journeylog'
class Oystercard
  attr_reader :balance, :entrystation, :journeys


  MAXLIMIT = 90
  MINLIMIT = 1


  def initialize(balance = 0)
    @balance = balance
    @journeylog = JourneyLog.new
  end

  def topup(money)
    fail "Limit Reached" if @balance + money > MAXLIMIT
    @balance += money
  end

  def tapin(station)
      fail "Can't travel - need £1"  if @balance <= MINLIMIT
      @journeylog.start(station)
  end

  def tapout(exitstation)
    # @journeys.push({"entry" => @entrystation, "exit" => exitstation})
    # @entrystation = nil
    @journeylog.finish(exitstation)
    deduct(@journeylog.journeys.last.fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
