class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.instrument.user != user
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
