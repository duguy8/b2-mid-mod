# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  thrill_rating: 8,
  open: true,
  amusement_park_id: park.id
)
@lightening = @mechanic_1.rides.create!(
  name: "Lightning Bolt",
  thrill_rating: 5,
  open: true,
  amusement_park_id: park.id
)
@pitfall = @mechanic_1.rides.create!(
  name: "Pitfall",
  thrill_rating: 9,
  open: true,
  amusement_park_id: park.id
)
@ferris_wheel = @mechanic_1.rides.create!(
  name: "Ferris Wheel",
  thrill_rating: 2,
  open: false,
  amusement_park_id: park.id
)
