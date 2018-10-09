class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :issue_id, :user_id, :created_at
  belongs_to :issue
end
