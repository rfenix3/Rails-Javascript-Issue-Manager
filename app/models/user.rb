class User < ApplicationRecord
  has_many :issues
  has_many :employees, :through => :issues

  def index
  end
end
