class Code < ActiveRecord::Base
  attr_accessible :code, :is_deleted, :username, :password
  attr_encrypted :password, :key => 'zaqxswcdevfrbgtnhymjukilop1234567890'
  validates_presence_of(:code)
  validates_presence_of(:password)
  has_one(:user)
end
