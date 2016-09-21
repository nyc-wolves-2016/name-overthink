class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes
  has_many :answer_comments, through: :comments, source: :commentable, source_type: 'Answer'
  has_many :question_comments, through: :comments, source: :commentable, source_type: 'Question'

  has_secure_password

  validates :first_name, :last_name, :username, :email, :timestamps, presence: true
  validates :username, uniqueness: true

  validates :email, uniqueness: { message: "has already been used." }, format: { with: /.+\@+.+[.]/, message: "must be a valid email address"}

end
