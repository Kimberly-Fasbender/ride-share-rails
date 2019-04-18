class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true
  validates :car_make, presence: true
  validates :car_model, presence: true

  def self.next_available
    return Driver.where(available: true).order(:updated_at).first
  end

  def average_rating
    rated_trips = trips.where.not(rating: nil)
    return if rated_trips.empty?
    sum = trips.sum do |trip|
      trip.rating if trip.rating
    end
    return (sum / rated_trips.count.to_f)
  end

  def total_earnings
    return trips.sum { |trip| (trip.cost - 1.65) * 0.8 }
  end
end
