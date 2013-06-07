class Question < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  has_many :answers
  has_many :comments
  has_many :question_labels

end
