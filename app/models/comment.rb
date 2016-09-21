class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, :commentable_id, :commentable_type, :user_id, presence: true
end
