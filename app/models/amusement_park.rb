class AmusementPark < ApplicationRecord
  validates_presence_of :name,
                        :admissions
  has_many :rides

  def rides_order
    rides.order(:name)
  end

  def average_thrill
    rides.average(:thrill_rating)
  end
end
