require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :years_experience}
  end

  describe "relationships" do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe "class methods" do
    it "can find average years experience for all mechanics" do
      mechanic_1 = Mechanic.create!(
        name: "Joe Schmo",
        years_experience: 2
      )
      mechanic_2 = Mechanic.create!(
        name: "Lily Hammersmith",
        years_experience: 10
      )
      mechanic_3 = Mechanic.create!(
        name: "Thor",
        years_experience: 6
      )
      expect(Mechanic.average_experience.floor).to eq(6)
    end

    describe "instance methods" do
      it "can sort rides by being open and by most thrilling" do
      mechanic_1 = Mechanic.create!(
        name: "Lily Hammersmith",
        years_experience: 8
      )
      phantom = mechanic_1.rides.create!(
        name: "The Phantom",
        thrill_rating: 11,
        open: true
      )
      lightening = mechanic_1.rides.create!(
        name: "Lightning Bolt",
        thrill_rating: 10,
        open: true
      )
      pitfall = mechanic_1.rides.create!(
        name: "Pitfall",
        thrill_rating: 9,
        open: true
      )
      ferris_wheel = mechanic_1.rides.create!(
        name: "Ferris Wheel",
        thrill_rating: 2,
        open: false
      )
      expect(mechanic_1.open_rides.first).to eq(phantom)
      end

      it "can find a ride by id and add it" do
        mechanic_1 = Mechanic.create!(
          name: "Lily Hammersmith",
          years_experience: 8
        )
        ferris_wheel = Ride.create!(
          name: "Ferris Wheel",
          thrill_rating: 2,
          open: false
        )
        expect(mechanic_1.rides).to be_empty
        mechanic_1.add_ride(ferris_wheel.id)
        expect(mechanic_1.rides.first.name).to eq(ferris_wheel.name)
      end
    end
  end
end
