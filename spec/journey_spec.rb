require "journey"

describe Journey do
 it "Has an entry station" do
   journey = Journey.new("Paddington")
   expect(journey.entrystation).to eq("Paddington")
 end

 it "Has a default entry station of nil" do
   journey = Journey.new()
   expect(journey.entrystation).to eq nil
 end

 it "Has an exit station" do
   journey = Journey.new("Paddington")
   journey.exit("Edgware Road")
   expect(journey.exitstation).to eq("Edgware Road")
 end

 it "Has a fare of 6 if no entrystation recorded" do
   journey = Journey.new()
   expect(journey.fare).to eq 6
 end

 it "Has a fare of 6 if no exitstation recorded" do
   journey = Journey.new("Paddington")
   journey.exit()
   expect(journey.fare).to eq 6
 end

 it "Has a fare of 1 if entry/exit stations recorded" do
   journey = Journey.new("Paddington")
   journey.exit("Edgware Road")
   expect(journey.fare).to eq 1
 end

 context 'Returns a fare of' do

  let (:station_double) {double :station}
  let (:station_double2) {double :station}

  before :each do
    @journey = Journey.new(station_double)
    @journey.end(station_double2)
  end

  it '2 when going from zone 1 to 2' do
    zones(1,2)
    expect(@journey.fare).to eq 2
 end

 it '5 when going from zone 5 to 1' do
  zones(5,1)
  expect(@journey.fare).to eq 5
end

it '1 when going from zone 1 to 1' do
  zones(1,1)
  expect(@journey.fare).to eq 1
end
end
end


def zones(n,m)
  allow(station_double).to receive(:zone).and_return(n)
  allow(station_double2).to receive(:zone).and_return(m)
end
