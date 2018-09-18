class Issue < ApplicationRecord
  validates :title, :created, presence: true
  validates :effort, numericality: {only_integer: true, allow_nil: true}

  belongs_to :user
  belongs_to :employee
  validates :user, :employee, presence: true

end
