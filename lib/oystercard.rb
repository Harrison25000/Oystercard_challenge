class Oystercard
  attr_reader :balance, :state

  MAXLIMIT = 90

  def initialize(balance = 0, state)
    @state = state
    @balance = balance
  end

  def topup(money)
    fail "Limit Reached" if @balance + money > MAXLIMIT
    @balance += money
  end

  def deduct(amount)
    @balance -= amount
  end

  def tapin
    @state = true
  end

  def journey
  if  @state == true
    "In use"
  else
    "Not in use"
  end
  end

  def tapout
    @state = false
  end

end
