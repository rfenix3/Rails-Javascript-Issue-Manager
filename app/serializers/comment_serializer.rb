class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :issue_id, :user_id
  belongs_to :issue
end
