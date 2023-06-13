class FishingTripPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user_signed_in?
  end

  def show?
    user == record.user
  end
end
