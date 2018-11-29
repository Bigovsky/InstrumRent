class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    temp = true
    record.booking.reviews.each do |review|
      temp = false if review.booking.user == user
    end
    temp
  end
end
