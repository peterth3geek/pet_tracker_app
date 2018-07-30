class Family < ApplicationRecord
  has_many :pets
  has_many :owners
end
