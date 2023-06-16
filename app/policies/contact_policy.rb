class ContactPolicy < ApplicationPolicy
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
    true
  end

  def update?
    user == record.user
  end

  def destory?
    user == record.user
  end
end
