class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def user_now
    if session[:owner_id]
      @owner = Owner.find(session[:owner_id])
    else
    end
  end

  def logged_time
    if self.time.strftime("%m/%d/%Y") == Time.now.strftime("%m/%d/%Y")
      self.time.strftime("%I:%M %P today.")
    else
    self.time.strftime("%I:%M %P on %m/%d/%Y")
  end
  end

  def create_last_activity(input)
    activity_array = []
    input.delete_if {|x| x == nil || x == "No Activity Yet!"}
    if input.empty?
      activity_array << "No Activity Yet!"
    # elsif input[0] == "No Activity Yet!" || input == "No Activity Yet!"
    #   activity_arrays
    else
      activity_array = input.sort_by do |t|
          t.time
      end
    end
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
    elsif input.class == Appointment && input.time >= Time.zone.now
      "has an appointment"
    elsif input.class == Appointment && input.time < Time.zone.now
      "had an appointment"
    elsif input.pet.species.downcase == "dog"
      "was walked"
    elsif input.pet.species.downcase == "cat"
      "had litter box scooped"
    elsif input.pet.species.downcase == "fish"
      "had tank cleaned"
    else
      "had cage cleaned"
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

  def future_appointments
    self.appointments.select {|x| x.time > Time.zone.now}
  end

  def next_appointment
    self.future_appointments.first
  end

end
