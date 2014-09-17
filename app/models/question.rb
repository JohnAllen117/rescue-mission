class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :user, presence: true
  validates :title, length: {minimum: 40,
    too_short: "%{count} characters is the minimum."}
  validates :body, length: {minimum: 150,
    too_short: "%{count} characters is the minimum."}
end
