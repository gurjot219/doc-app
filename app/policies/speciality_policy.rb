class SpecialityPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      @scope.all
    end

    def edit?
      update?
    end

    def update?
      @user.admin?
    end

    def delete?
      @user.admin?
    end

    def create?
      @user.admin?
    end

    def new?
      create?
    end
  end
end
