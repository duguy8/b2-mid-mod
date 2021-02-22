class Ride < ApplicationRecord
  validates_presence_of :name,
                        :thrill_rating,
                        :open
end
