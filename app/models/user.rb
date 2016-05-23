class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  has_many :rides
  has_many :attractions, :through => :rides


  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end

end
