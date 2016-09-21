class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :value, :user_id, :voteable_id, :voteable_type, presence: true
end
