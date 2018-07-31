class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def logged_time
    self.time.strftime("%I:%M %p on %m/%d/%Y")
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
