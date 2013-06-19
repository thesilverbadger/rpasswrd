class Code < ActiveRecord::Base
  attr_accessible :code, :is_deleted, :password, :username
end
