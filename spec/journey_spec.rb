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

end
