class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  has_many(:codes)

  before_save do self.email.downcase! end

  def self.find_by_lower_email(email)
    User.find_by_email(email.downcase)
  end
end
