require "oystercard"

describe Oystercard do

  let(:station){double :station}
  let(:exitstation){double :exitstation}

  it "Has a balance" do
    oystercard = Oystercard.new(0)
    expect(oystercard.balance).to eq 0
  end

  it "Adds money to balance" do
    oystercard = Oystercard.new(0)
    oystercard.topup(5)
    expect{oystercard.topup 5}.to change{oystercard.balance}.by 5
  end

  it "Raises an error if more than £90"do
    oystercard = Oystercard.new(90)
    expect{oystercard.topup(1)}.to raise_error "Limit Reached"
  end

  it "Is on journey" do
    oystercard = Oystercard.new(10)
    oystercard.tapin(station)
    expect(oystercard.in_journey?).to eq true
  end

  it "Is not on a journey" do
    oystercard = Oystercard.new(10)
    oystercard.tapin(station)
    oystercard.tapout(exitstation)
    expect(oystercard.in_journey?).to eq false
  end

  it "Needs minimum £1 to travel" do
    oystercard = Oystercard.new(0.5)
    expect{oystercard.tapin(station)}.to raise_error "Can't travel - need £1"

  end

  it "Deducts minimum fare when tapping out" do
    oystercard = Oystercard.new(5)
    oystercard.tapin(station)
    expect{oystercard.tapout(exitstation)}.to change{oystercard.balance}.by(-Oystercard::MINLIMIT)
  end

  it "remembers station when tapin" do
    oystercard = Oystercard.new(5)
    oystercard.tapin(station)
    expect(oystercard.entrystation).to eq station
  end

  it "forgets entry station on tapout" do
    oystercard = Oystercard.new(5)
    oystercard.tapin(station)
    oystercard.tapout(exitstation)
    expect(oystercard.entrystation).to eq nil
  end

  it "Starts with no journey" do
    oystercard = Oystercard.new(10)
    expect(oystercard.journeys).to be_empty
  end

  it "Has a list of journeys" do
    oystercard = Oystercard.new (10)
    oystercard.tapin(station)
    oystercard.tapout(exitstation)
    expect(oystercard.journeys).to include({"entry" => station, "exit" => exitstation})
  end



end
