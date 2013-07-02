class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments
  has_many :votes
  attr_accessible :best, :body, :question, :user, :comments, :votes
  validates :body, :presence => true
end
