class Ability
  include CanCan::Ability

  def initialize(user)

    #alias_action :read, :show_possible_tasks, :to => :agent_actions

    user ||= User.new # guest user (not logged in)
    if user.role? 'admin'
      can :manage, :all
    elsif user.role? 'operator'
      can :manage, :all
    elsif user.role? 'agent'
      can :show_possible_tasks, Task
      can :take, TaskInstance
      can :cancel, TaskInstance
      can :update_changes_agent, TaskInstance
      can :my_tasks, TaskInstance
      can :my_statistic, TaskInstance
      can :remaining_time, TaskInstance
      can :create, Payout
      can :my_user_data, User
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
