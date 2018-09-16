class Issue < ApplicationRecord
  belongs_to :support
  belongs_to :employee
end
