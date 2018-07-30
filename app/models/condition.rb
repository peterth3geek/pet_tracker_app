class Condition < ApplicationRecord
  belongs_to :pet
  has_many :appointments
end
