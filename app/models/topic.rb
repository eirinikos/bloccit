class Topic < ActiveRecord::Base
  has_many :posts

  validates :topic, length: {minimum: 5}, presence: true
end
