class Show < ActiveRecord::Base
	has_many :djs
	has_many :songs

  def timeslot
    return self.start_time.strftime("%I:%M %p") + " to " + self.end_time.strftime("%I:%M %p")
  end
end
