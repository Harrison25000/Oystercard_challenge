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
end
