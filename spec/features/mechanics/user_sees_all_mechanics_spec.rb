require "rails_helper"

RSpec.describe "When I visit 'mechanics_path'" do
  before :each do
    @mechanic_1 = Mechanic.create!(
      name: "Joe Schmo",
      years_experience: 5
    )
    @mechanic_2 = Mechanic.create!(
      name: "Lily Hammersmith",
      years_experience: 8
    )
    @mechanic_3 = Mechanic.create!(
      name: "Thor",
      years_experience: 100
    )
  end

  describe "I see a header saying 'All Mechanics'" do
    it "Lists mechanics names/experience and average years of exp" do

      visit mechanics_path

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.years_experience)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_3.years_experience)
      expect(page).to have_content("Average years of experience: 37.67")
    end
  end
end
