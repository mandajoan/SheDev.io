class Post < ApplicationRecord
  def self.categories
    ['job', 'event', 'question']
  end
  belongs_to :user
  has_many :comments
end
