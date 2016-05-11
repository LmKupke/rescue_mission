class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :answers
  has_many :users,
    through: :answers


  validates :creator, presence: true
  validates :title, presence: true, length: { minimum: 40, too_short: "%{count} characters is the minimum allowed"}
  validates :description, presence: true, length: { minimum: 40, too_short: "%{count} characters is the minimum allowed"}

  def responders
    users
  end
end
