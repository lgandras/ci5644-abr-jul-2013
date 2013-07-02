class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, :join_table => :users_roles
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :username
  attr_accessible :password, :password_confirmation, :remember_me
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  after_create :assign_regular_role
private
  def assign_regular_role
    if self.roles.empty?
      self.add_role "regular"
    end
  end
end
