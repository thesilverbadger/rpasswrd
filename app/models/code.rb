class Code < ActiveRecord::Base
  attr_accessible :code, :is_deleted, :username, :password
  attr_encrypted :password, :key => 'zaqxswcdevfrbgtnhymjukilop1234567890'
  has_one(:user)
end
