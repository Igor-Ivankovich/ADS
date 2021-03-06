# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Post
    elsif user.admin?
      # can :read, Post
      # can :destroy, Post
      can :read, Post
      can :update, Post do |item|
        item.try(:post_type) == 'M'
      end
      can :manage, Adminca
      can :manage, User
      can :manage, Role
      can :manage, Tag
      # can :read, Post

    elsif user.seller?
      can :read, Tag
      can :manage, Interface
      can :read, Post
      can :update, Post do |item|
        item.try(:post_type) == 'C' || item.try(:post_type) == 'AR' || item.try(:post_type) == 'R'
      end
      can :create, Post
      can :destroy, Post do |item|
        item.try(:user) == user
      end
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
