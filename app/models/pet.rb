class Pet < ApplicationRecord
  has_many :relationships
  has_many :owners, through: :relationships
  has_many :family
  has_many :wastes
  has_many :foods
  has_many :plays
  has_many :conditions
  has_many :appointments

  accepts_nested_attributes_for :owners

  def owners_attributes=(owner_attributes)
    owner_attributes.values.each do |owner_attr|
      owner = Owner.find_or_create_by(owner_attr)
      self.owners << owner
    end
  end


end
