class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
  	if issues?
  		issues?
  	else
  		#binding.pry
  		self.user.nausea+=self.attraction.nausea_rating
  		self.user.happiness+=self.attraction.happiness_rating
  		self.user.tickets-=self.attraction.tickets
  		user.save
  		"Thanks for riding the #{self.attraction.name}!"
  	end
  end

  def issues?
  	alerts=[]
  	alerts << "You do not have enough tickets the #{self.attraction.name}." unless enough_tickets?
  	alerts << "You are not tall enough to ride the #{self.attraction.name}." unless tall_enough?
  	(alerts.length==0) ? false : ("Sorry. "+alerts.join(" "))
  end

  def enough_tickets?
	self.user.tickets>=self.attraction.tickets
  end

  def tall_enough?
  	self.user.height>=self.attraction.min_height
  end
end
