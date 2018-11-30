class InstrumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
    end
  end

  def dashboard?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end
end
