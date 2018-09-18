class User < ApplicationRecord
  has_secure_password

  validates :name, :password, :role, presence: true
  validates :name, uniqueness: true

  validates :password, length: { in: 4..20, 
    too_short: "%{count} characters is the minimum allowed" }

  has_many :issues, inverse_of: :user
  has_many :employees, :through => :issues


end
