class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    # @user => record
    # current_user => user
    record == user || user.admin # O mesmo que @user == current_user
  end
end
