class Appointment < ApplicationRecord
  belongs_to :condition
  belongs_to :owner
  has_one :pet, through: :condition
end
