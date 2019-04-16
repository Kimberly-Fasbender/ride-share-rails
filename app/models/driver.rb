class Driver < ApplicationRecord
  has_many :trips

  def self.next_available
    return Driver.find_by(available: true)
  end
end
