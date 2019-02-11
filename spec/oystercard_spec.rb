require "oystercard"

describe Oystercard do
  it "Has a balance" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0

  end

end
