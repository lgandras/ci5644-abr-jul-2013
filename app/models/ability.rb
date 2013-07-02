class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
        Rails.logger.debug "user: #{user} admin"
     #User
        can :index,     User
        can :update,    User
        can :edit,      User
        can :destroy,   User
      #Question
        can :index,     Question
        can :show,      Question
        can :destroy,   Question
    elsif user.has_role? :regular
        Rails.logger.debug "user: #{user} regular"
      #User
        can :update, User, :id => user.id
      #Question
        can [:new, :create, :index, :show], Question
    elsif user.roles.empty?
        Rails.logger.debug "user: #{user} nil"
      #User
        can :new, User
        can :create, User
      #Question
        can :show, Question
        can :index, Question
    else
        Rails.logger.debug "user: #{user} other"
    end
  end
end
