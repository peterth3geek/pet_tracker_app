class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def logged_time
    if self.time.strftime("%m/%d/%Y") == Time.now.strftime("%m/%d/%Y")
      self.time.strftime("%I:%M %P today.")
    else
    self.time.strftime("%I:%M %P on %m/%d/%Y")
  end
  end

  def create_last_activity(input)
    activity_array = []
    input.delete_if {|x| x == nil}
    if input.empty?
      activity_array << "No Activity Yet!"
    elsif input[0] == "No Activity Yet!"
      activity_array
    else
      activity_array = input.sort_by do |t|
          t.time
          # binding.pry
      end
    end
    # binding.pry
      activity_array.last
      end

  def recent_activity(input)
    # binding.pry
    if input == "No Activity Yet!"
      input
    elsif input.class == Play
      "was played with"
    elsif input.class == Food
      "was fed"
    elsif input.class == Appointment
      "had an appointment"
    else
      "had waste taken care of"
    end
  end

  def living_method
    self.create_last_activity(self.live_feed)
  end

  def display_most_recent
    if self.living_method == ["No Activity Yet!"] || self.living_method == nil
      ["No Activity Yet!"]
    else
      self.living_method
    end
  end


end
