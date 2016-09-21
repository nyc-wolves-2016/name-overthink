class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user
  has_many :answers

  validates :user_id, :title, :content, presence: true
end
