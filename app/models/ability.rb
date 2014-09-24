class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, [Shift, User]
      can :update, Desk
      can [:take_shift, :sub_shift], Static
      can :read, Static
    elsif user.supervisor?
      can [:update, :read], [Shift, Desk, User]
      can [:create, :destroy], User
      can [:take_shift, :sub_shift], Static
      can :read, Static
    else
      can :update, User, :user_id => user.id
      can :show, User, :id => user.id
      can :update, Shift, :user_id => user.id
      can [:take_shift, :sub_shift], Static
      can :read, [Shift, Desk, Static]
    end

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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end