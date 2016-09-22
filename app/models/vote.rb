class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :value, :user_id, :voteable_id, :voteable_type, presence: true
  validate :has_voted?

  def has_voted?
    user = User.find(self.user_id)
    if user.votes.any? { |vote| vote.voteable_id == self.voteable_id && vote.voteable_type == self.voteable_type }
      errors.add(:user, "already voted.")
    end
  end

  def self.vote_count(votes)
    votes.reduce(0) { |sum, vote| sum + vote.value }
  end

end

