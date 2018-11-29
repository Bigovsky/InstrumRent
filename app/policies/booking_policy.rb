class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
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

  def create_review?
    record.user == user
  end
end
