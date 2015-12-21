class Show < ActiveRecord::Base
	has_many :djs

  def timeslot
    return self.start_time.strftime("%I:%M %p") + " to " + self.end_time.strftime("%I:%M %p")
  end
end
