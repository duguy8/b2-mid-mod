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
        park = AmusementPark.create!(
          name: "Cedar Point",
          admissions: 70
        )
        mechanic_1 = Mechanic.create!(
          name: "Lily Hammersmith",
          years_experience: 8
        )
        phantom = park.rides.create!(
          name: "The Phantom",
          thrill_rating: 11,
          open: true
        )
        lightening = park.rides.create!(
          name: "Lightning Bolt",
          thrill_rating: 10,
          open: true
        )
        pitfall = park.rides.create!(
          name: "Pitfall",
          thrill_rating: 9,
          open: true
        )
        ferris_wheel = park.rides.create!(
          name: "Ferris Wheel",
          thrill_rating: 2,
          open: false
        )

        mechanic_1.rides << [phantom, lightening, pitfall]

        expect(mechanic_1.open_rides.first).to eq(phantom)
      end

      it "can find a ride by id and add it" do
        park = AmusementPark.create!(
          name: "Cedar Point",
          admissions: 70
        )
        mechanic_1 = Mechanic.create!(
          name: "Lily Hammersmith",
          years_experience: 8
        )
        ferris_wheel = park.rides.create!(
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
