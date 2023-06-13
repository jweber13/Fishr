class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:)
    end
  end

  def show?
    user == record.user
  end

  def create?
    user_logged_in?
  end

  def destory?
    user == record.user
  end
end
