require "rails_helper"

RSpec.describe "When I visit a mechanics show page" do
  before :each do
    @mechanic_1 = Mechanic.create!(
      name: "Joe Schmo",
      years_experience: 5
    )
    @phantom = @mechanic_1.rides.create!(
      name: "The Phantom",
      thrill_rating: 8,
      open: true
    )
    @lightening = @mechanic_1.rides.create!(
      name: "Lightning Bolt",
      thrill_rating: 5,
      open: true
    )
    @pitfall = @mechanic_1.rides.create!(
      name: "Pitfall",
      thrill_rating: 9,
      open: true
    )
    @ferris_wheel = @mechanic_1.rides.create!(
      name: "Ferris Wheel",
      thrill_rating: 2,
      open: false
    )
    @steel = Ride.create!(
      name: "Steel Vengeance",
      thrill_rating: 10,
      open: true
    )
  end

  describe "I see a form to add a ride to that mechanic" do
    it "finds ride by the rides id" do

      visit mechanic_path(@mechanic_1.id)

      expect(page).to have_button("Add Ride")

      fill_in (:search), with: "#{@steel.id}"
      click_button("Add Ride")

      expect(current_path).to eq(mechanic_path(@mechanic_1.id))
      expect(page).to have_content(@steel.name)
    end
  end
end
