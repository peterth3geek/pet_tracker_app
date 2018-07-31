class Pet < ApplicationRecord
  has_many :relationships
  has_many :owners, through: :relationships
  has_many :family
  has_many :wastes
  has_many :foods
  has_many :plays
  has_many :conditions
  has_many :appointments

  has_one_attached :image

  accepts_nested_attributes_for :owners

  def owners_attributes=(owner_attributes)
    owner_attributes.values.each do |owner_attr|
      owner = Owner.find_or_create_by(owner_attr)
      self.owners << owner
    end
  end

  def most_recent
    x = []
    act = []
    act << max_plays
    act << max_foods
    act << max_appts
    act << max_wastes
    act.delete_if {|x| x == nil}
    if act.empty?
      x << "No Activity Yet!"
    else
    x = act.sort_by do |t|
      t.time
      end
    end
    x.last
  end

  def max_plays
    self.plays.last
  end

  def max_wastes
    self.wastes.last
  end

  def max_foods
    self.foods.last
  end

  def max_appts
      self.appointments.last
  end

end
