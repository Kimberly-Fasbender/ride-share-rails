class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_spent
    return "$%0.2f" % [self.trips.sum { |trip| trip.cost }]
  end
end
