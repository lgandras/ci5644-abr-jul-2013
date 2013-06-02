class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title
  has_many :answers
end
