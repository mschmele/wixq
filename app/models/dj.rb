class Dj < ActiveRecord::Base
  belongs_to :show
  has_secure_password

  def full_name
    self.first_name + " "  + self.last_name
  end
end
