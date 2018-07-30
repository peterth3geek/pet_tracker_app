class Owner < ApplicationRecord
  has_many :relationships
  has_many :pets, through: :relationships
  has_many :families
  has_many :appointments
  has_many :wastes
  has_many :foods
  has_many :plays

  has_secure_password
end
