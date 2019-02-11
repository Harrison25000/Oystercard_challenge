class Oystercard
  attr_reader :balance

  MAXLIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def topup(money)
    fail "Limit Reached" if @balance + money > MAXLIMIT
    @balance += money
  end

end
