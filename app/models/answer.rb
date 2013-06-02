class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :best, :body
  has_many :comments, :votes
end
