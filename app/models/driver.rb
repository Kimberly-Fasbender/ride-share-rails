class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true
  validates :car_make, presence: true
  validates :car_model, presence: true

  def self.next_available
    return Driver.where(available: true).order(:updated_at).reverse_order
  end

  def average_rating
    rated_trips = trips.where.not(rating: nil)
    return if rated_trips.empty?
    sum = trips.sum do |trip|
      trip.rating if trip.rating
    end
    return sum / rated_trips.count.to_f
  end

  def total_earnings
    return self.trips.sum { |trip| trip.cost } / 100
  end
end
