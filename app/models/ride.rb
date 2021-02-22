class Ride < ApplicationRecord
  validates_presence_of :name,
                        :thrill_rating
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
  belongs_to :amusement_park
end
