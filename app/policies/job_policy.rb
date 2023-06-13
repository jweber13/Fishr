class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(fishing_trip: @fishing_trip)
    end
  end

  def create?
    user == @fishing_trip.user
  end

  def show?
    user == record.user
  end
end
