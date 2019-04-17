class Driver < ApplicationRecord
  has_many :trips

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
end
