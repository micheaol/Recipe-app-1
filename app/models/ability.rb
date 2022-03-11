class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true

    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
    can :manage, Inventory, user_id: user.id
  end
end
