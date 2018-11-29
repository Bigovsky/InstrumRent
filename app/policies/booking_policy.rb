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
    temp = true
    record.reviews.each do |review|
      temp = false if review.booking.user == user
    end
    record.user == user && temp
  end
end
