class Question < ActiveRecord::Base
  
  belongs_to :user
  has_many :answers, :dependent => :destroy
  has_many :comment_questions, :dependent => :destroy
  has_many :question_labels, :dependent => :destroy
  attr_accessible :content, :title
  validates :content, :title, :presence => true

end
