class Oystercard
  attr_reader :balance, :entrystation, :journeys


  MAXLIMIT = 90
  MINLIMIT = 1


  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def topup(money)
    fail "Limit Reached" if @balance + money > MAXLIMIT
    @balance += money
  end

  def tapin(station)
      fail "Can't travel - need £1"  if @balance <= MINLIMIT
      @entrystation = station
  end

  def in_journey?
    if  @entrystation != nil
       true
    else
       false
    end
  end

  def tapout(exitstation)
    deduct
    @journeys.push({"entry" => @entrystation, "exit" => exitstation})
    @entrystation = nil
  end

  private

  def deduct
    @balance -= MINLIMIT
  end

end
