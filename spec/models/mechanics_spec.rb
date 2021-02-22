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
      @mechanic_1 = Mechanic.create!(
        name: "Joe Schmo",
        years_experience: 2
      )
      @mechanic_2 = Mechanic.create!(
        name: "Lily Hammersmith",
        years_experience: 10
      )
      @mechanic_3 = Mechanic.create!(
        name: "Thor",
        years_experience: 6
      )
      expect(Mechanic.average_experience).to eq(6)
    end
  end
end
