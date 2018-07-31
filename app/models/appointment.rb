class Appointment < ApplicationRecord
  belongs_to :owner
  belongs_to :pet

  before_validation :date_and_time

def date_and_time
  if self.time == nil
    self.update(time: self.date)
  elsif self.date == nil
    self.update(date: self.time)
  end
end


end
