class Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  attr_accessible :positive
end
