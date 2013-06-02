class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title
  has_many :answers
  has_many :comments
  has_many :question_labels
end
