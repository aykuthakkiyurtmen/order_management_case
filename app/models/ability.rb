# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, Store
      can :read, Product
      can :manage, Favorite
    end
  end
end
