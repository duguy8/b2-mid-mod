class AmusementPark < ApplicationRecord
  validates_presence_of :name,
                        :admissions
  has_many :rides
end
