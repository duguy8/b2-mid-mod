require "rails_helper"

RSpec.describe "When I visit an amusement parks show page" do
  before :each do
    @park_1 = AmusementPark.create!(
      name: "KennyWood",
      admissions: 30
    )
    @phantom = @park_1.rides.create!(
      name: "The Phantom",
      thrill_rating: 8,
      open: true
    )
    @lightening = @park_1.rides.create!(
      name: "Lightning Bolt",
      thrill_rating: 5,
      open: true
    )
    @pitfall = @park_1.rides.create!(
      name: "Pitfall",
      thrill_rating: 9,
      open: true
    )
  end

  describe "I see name and admissions, name of all rides in alph order" do
    it "Also shows average thrill rating of rides" do

      visit amusement_park_path(@park_1.id)
      save_and_open_page
      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.admissions)
      expect(page).to have_content(@phantom.name)
      expect(page).to have_content(@lightening.name)
      expect(page).to have_content(@pitfall.name)

      expect(@lightening.name).to appear_before(@phantom.name)
      expect(@pitfall.name).to appear_before(@phantom.name)
      expect(@lightening.name).to appear_before(@pitfall.name)

      expect(page).to have_content("Average Thrill Rating of Rides: #{@park_1.average_thrill.round(1)}/10")
    end
  end
end
