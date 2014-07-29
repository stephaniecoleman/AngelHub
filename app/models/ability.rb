class Ability
  include CanCan::Ability

  def initialize(user)
    # CanCan uses the current_user method and here we define what the user
    # is allowed to do
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    case user
    when Developer
        # developers can view Organizations, but cannot do any of the other crud
        # actions on them
        cannot [:create, :update, :destroy], Organization
        can :read, Organization
    when Organization
        # organizations can view Developers, but cannot do any of the other crud
        # actions on them
        cannot [:create, :update, :destroy], Developer
        can :read, Developer
        # organizations can edit, update, delete projects if they are the owners
        can :create, Project
        can [:edit, :update, :destroy], Project, :organization_id => user.id
    end

    # all users(devs and organizations) can see projects
    can :read, Project

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
