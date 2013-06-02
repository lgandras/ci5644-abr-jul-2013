class QuestionLabel < ActiveRecord::Base
  belongs_to :label
  belongs_to :question
  # attr_accessible :title, :body
end
