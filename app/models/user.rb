class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  validates :fname, presence: true
  validates :lname, presence: true
end
