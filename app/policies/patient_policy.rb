class PatientPolicy < ApplicationPolicy


  def index?
    @user.admin? || @user.doctor?
  end

  def edit?
    @user.admin? || @user.patient?
  end

  def update?
    @user.admin? || @user.patient?
  end

  def delete?
    @user.admin? || @user.patient?
  end

  def create?
    @user.admin? || @user.patient?

  end

  def new?
    @user.admin? || @user.patient?
  end

  def show?
    @user.admin? || @user.patient? || @user.doctor?
  end
end
