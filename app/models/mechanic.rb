class Mechanic < ApplicationRecord
  validates_presence_of :name,
                        :years_experience
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience
    average(:years_experience)
  end
end
