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

  def self.live_feed
    arr = self.all.select do |pet|
      pet.most_recent
    end
    arr
  end

  def recent_activity
    # binding.pry
    if most_recent == "No activity yet!"
      most_recent.first
    elsif most_recent.class == Play
      "was played with"
    elsif most_recent.class == Food
      "was fed"
    elsif most_recent.class == Appointment
      "had an appointment"
    else
      "had waste taken care of"
    end
  end

  def most_recent
    x = []
    act = []
    act << max_plays
    act << max_foods
    act << max_appts
    act << max_wastes
    # binding.pry
    act.delete_if {|x| x == nil}
    if act.empty?
      x << "No Activity Yet!"
    else
    x = act.sort_by do |t|
        t.time
    end
    # binding.pry
    x.last
    end
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
