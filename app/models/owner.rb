class Owner < ApplicationRecord
  has_many :relationships
  has_many :pets, through: :relationships
  has_many :families
  has_many :appointments
  has_many :wastes
  has_many :foods
  has_many :plays



  has_secure_password

  # before_validation default_stats

  validates :name, uniqueness: true

  has_one_attached :image

def live_feed
  self.pets.map {|pet| pet.most_recent}
end

def all_feed
  self.pets.map {|pet| pet.my_log}.flatten
end

def sorted_all_feed
  self.all_feed.flatten.sort_by {|thing| thing.time}.reverse
end

end
