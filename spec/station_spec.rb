require "station"

describe Station do

it "Is has a name" do
  station = Station.new("Paddington", 1)
  expect(station.name).to eq "Paddington"
end

it "Has a zone" do
  station = Station.new("Paddington", 1)
  expect(station.zone).to eq 1
end

end
