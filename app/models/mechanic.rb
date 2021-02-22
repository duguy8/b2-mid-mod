class Mechanic < ApplicationRecord
  validates_presence_of :name,
                        :years_experience
end
