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

  def all_plays
    self.plays.map {|play| play}
  end
  def all_wastes
    self.wastes.map {|waste| waste}
  end
  def all_foods
    self.foods.map {|food| food}.delete_if{|x| x.time == nil}
  end
  def all_appointments
    self.appointments.map {|appointment| appointment}
  end

  def my_log
    x = []
    all_of_it = []
    all_of_it << self.all_plays
    all_of_it << self.all_wastes
    all_of_it << self.all_foods
    all_of_it << self.all_appointments
    all_of_it.flatten
    all_of_it.flatten.delete_if {|x| x == nil}
    all_of_it.flatten.delete_if {|x| x.time == nil}
    # binding.pry
    if all_of_it.empty?
      x << "No Activity Yet!"
    else
    x = all_of_it.flatten.sort_by do |t|
      t.time
      end
    end
    x
  end

  def sort_my_log
    self.my_log.flatten.sort_by {|thing| thing.time}.reverse
  end

  def are_you_mine
    self.owners.map {|owner| owner.id}
  end

end
