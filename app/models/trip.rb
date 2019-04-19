class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :date, :cost, presence: true
end
