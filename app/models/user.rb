class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :name, :rol, :username
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  before_save :default_values
  def default_values
    self.rol ||= 'regular'
  end
end
