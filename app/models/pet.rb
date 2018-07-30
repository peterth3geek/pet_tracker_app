class Pet < ApplicationRecord
  has_many :relationships
  has_many :owners, through: :relationships
  belongs_to :family
  has_many :wastes
  has_many :foods
  has_many :plays
  has_many :conditions
  has_many :appointments, through: :conditions
end
