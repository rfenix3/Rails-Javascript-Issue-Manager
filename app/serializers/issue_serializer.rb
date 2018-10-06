class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :owner, :created, :effort, :completion_date, :employee_id, :user_id
  belongs_to :user
  belongs_to :employee
  has_many :comments
end

