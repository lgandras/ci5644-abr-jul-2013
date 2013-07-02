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
        can    [               :index, :show,                         ], Answer
        can    [               :index, :show,                         ], CommentQuestion
        can    [               :index, :show,                 :destroy], Question
        can    [               :index, :show, :edit, :update, :destroy], User
    elsif user.has_role? :regular
        can    [:setbest                                              ], Answer, :question => {:user_id => user.id}
        can    [:new, :create, :index, :show                          ], Answer
        cannot [:new, :create                                         ], Answer, :question => {:user_id => user.id}
        can    [:new, :create, :index, :show                          ], Comment
        can    [:new, :create, :index, :show                          ], CommentQuestion
        can    [:new, :create, :index, :show                          ], Question
        can    [                              :edit, :update          ], User, :id => user.id
    elsif user.roles.empty?
        can    [               :index, :show                          ], Question
        can    [:new, :create                                         ], User
    end
  end
end
