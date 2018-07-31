class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def logged_time
    if self.time.strftime("%m/%d/%Y") == Time.now.strftime("%m/%d/%Y")
      self.time.strftime("%I:%M %P today.")
    else
    self.time.strftime("%I:%M %P on %m/%d/%Y")
  end
  end

  # def current_user
  #   binding.pry
  #   if session[:owner_id]
  #     @owner = Owner.find(session[:owner_id])
  #   else
  #   end
  # end

  # def mypets
  #   Relationship.all.select {|rel| rel.owner_id == current_user}
  # end

end
