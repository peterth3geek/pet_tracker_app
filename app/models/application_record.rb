class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def logged_time
    self.time.strftime("%I:%M %p on %m/%d/%Y")
  end

end
