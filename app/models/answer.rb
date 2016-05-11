class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :user_id, presence: true
  validates :user, presence: true
  validates :question_id, presence: true
  validates :question, presence: true
  validates :reply, presence: true, length: { minimum: 50, too_short: "%{count} characters is the minimum allowed"}

end
