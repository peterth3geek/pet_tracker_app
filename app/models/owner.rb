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
  validates :name, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validate :check_empty_space
  validates :name, length: { in: 3..12 }
  validates :password, length: { in: 6..20 }


  # /^[a-z0-9][-a-z0-9]{1,19}$/i

  has_one_attached :image


def check_empty_space
  if self.name.match(/\s+/)
    errors.add(:name, "Must contain no spaces!")
  end
end



def live_feed
  self.pets.map {|pet| pet.most_recent}
end

def all_feed
  self.pets.map {|pet| pet.my_log}.flatten
end

def sorted_all_feed
  self.all_feed.flatten.sort_by {|thing| thing.time}.reverse
end

def valid_owner
  @role == OWNER
end

def valid_caretaker
  @role == CARETAKER || @role == OWNER
end

def valid_sitter
  @role == SITTER || @role == CARETAKER || @role == OWNER
end

end
