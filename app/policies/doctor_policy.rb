class DoctorPolicy < ApplicationPolicy

  def edit?
    @user.admin? || @user.doctor?
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
  end
end
