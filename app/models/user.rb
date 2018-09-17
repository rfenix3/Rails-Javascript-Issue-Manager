class User < ApplicationRecord
  has_many :issues
  has_many :employees, :through => :issues

  has_secure_password

end
