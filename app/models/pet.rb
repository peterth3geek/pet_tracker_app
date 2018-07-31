class Pet < ApplicationRecord
  has_many :relationships
  has_many :owners, through: :relationships
  has_many :family
  has_many :wastes
  has_many :foods
  has_many :plays
  has_many :conditions
  has_many :appointments


end
