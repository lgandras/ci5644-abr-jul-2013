class Comment < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  attr_accessible :body
end
