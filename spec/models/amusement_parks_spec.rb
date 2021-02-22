require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :admissions}
  end

  describe "relationships" do
    it { should have_many :rides }
  end

  describe "instance methods" do
    it "can order rides alphabetically" do
      park_1 = AmusementPark.create!(
        name: "KennyWood",
        admissions: 30
      )
      phantom = park_1.rides.create!(
        name: "The Phantom",
        thrill_rating: 8,
        open: true
      )
      lightening = park_1.rides.create!(
        name: "Lightning Bolt",
        thrill_rating: 5,
        open: true
      )
      pitfall = park_1.rides.create!(
        name: "A Pitfall",
        thrill_rating: 9,
        open: true
      )
      
      expected = park_1.rides_order

      expect(expected.first.name).to eq("A Pitfall")
      expect(expected.last.name).to eq("The Phantom")
    end

    it "can find average thrill rating for its rides" do
      park = AmusementPark.create!(
        name: "Cedar Point",
        admissions: 70
      )
      @mechanic_1 = Mechanic.create!(
        name: "Lily Hammersmith",
        years_experience: 8
      )
      @phantom = @mechanic_1.rides.create!(
        name: "The Phantom",
        thrill_rating: 5,
        open: true,
        amusement_park_id: park.id
      )
      @lightening = @mechanic_1.rides.create!(
        name: "Lightning Bolt",
        thrill_rating: 4,
        open: true,
        amusement_park_id: park.id
      )
      @pitfall = @mechanic_1.rides.create!(
        name: "Pitfall",
        thrill_rating: 9,
        open: true,
        amusement_park_id: park.id
      )

      expect(park.average_thrill).to eq(6)
    end
  end
end
