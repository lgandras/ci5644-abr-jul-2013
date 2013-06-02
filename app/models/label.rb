class Label < ActiveRecord::Base
  attr_accessible :name
  has_many :question_labels
end
