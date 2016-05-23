class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    errors.add(:user, "You do not have enough tickets to ride the #{attraction.name}.") if user.tickets < attraction.tickets
    errors.add(:user, "You are not tall enough to ride the #{attraction.name}.") if user.height < attraction.min_height
    if errors.any?
      "Sorry. " + errors[:user].join(" ")
    else
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.tickets -= attraction.tickets
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

end
