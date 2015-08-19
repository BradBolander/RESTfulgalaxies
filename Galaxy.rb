class Galaxy < ActiveRecord::Base

  def to_s
    "Galaxy number: #{self.id} with a name of #{self.name}, has #{self.stars} stars, and is #{self.distance} across"
  end

end
