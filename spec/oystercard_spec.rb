require "oystercard"

describe Oystercard do

  it "Has a balance" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  it "Adds money to balance" do
    oystercard = Oystercard.new
    oystercard.topup(5)
    expect{oystercard.topup 5}.to change{oystercard.balance}.by 5
  end

  it "Raises an error if more than £90"do
    oystercard = Oystercard.new(90)
    expect{oystercard.topup(1)}.to raise_error "Limit Reached"
  end

  it "Deducts money" do
    oystercard = Oystercard.new(20)
    expect{oystercard.deduct(5)}.to change{oystercard.balance}.by -5
  end

end
