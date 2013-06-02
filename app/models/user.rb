class User < ActiveRecord::Base
  attr_accessible :email, :name, :rol, :username
  has_many :questions
end
