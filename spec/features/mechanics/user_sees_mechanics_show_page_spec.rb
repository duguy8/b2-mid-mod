require "rails_helper"

RSpec.describe "When I visit a mechanics show page" do
  before :each do
    @mechanic_1 = Mechanic.create!(
      name: "Lily Hammersmith",
      years_experience: 8
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
  end

  describe "I see their name, experience, name of rides theyve worked on" do
    it "only rides that are open, by most thrilling rides first descending" do

      visit mechanic_path(@mechanic_1.id)

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@phantom.name)
      expect(page).to have_content(@lightening.name)
      expect(page).to have_content(@pitfall.name)
      expect(page).not_to have_content(@ferris_wheel.name)

      expect(@pitfall.name).to appear_before(@phantom.name)
      expect(@pitfall.name).to appear_before(@lightening.name)
      expect(@phantom.name).to appear_before(@lightening.name)
    end
  end
end
