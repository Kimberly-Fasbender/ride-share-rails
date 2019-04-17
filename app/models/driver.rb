class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true
  validates :car_make, presence: true
  validates :car_model, presence: true

  def self.next_available
    return Driver.find_by(available: true)
  end

  def total_earnings
    return self.trips.sum { |trip| trip.cost } / 100
  end
end
