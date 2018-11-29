 class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_many :reviews


  validate :bookings_must_not_overlap
  validates :instrument, presence: true
  validates :user, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_change_to_be_saved
  validate :end_date_change_to_be_saved

  # def check_date
  #   start_date < end_date
  # end

    # def start_date_cannot_be_in_the_past
    #   if start_date.present? && start_date < Date.today
    #   errors.add(:start_date, "can't be in the past")
    #   end
    # end

    # def end_date_cannot_be_in_the_past
    #   if end_date.present? && end_date < Date.today
    #   errors.add(:end_date, "can't be in the past")
    #   end
    # end

    public
      def bookings_must_not_overlap
        return if self
              .class
              .where.not(id: id)
              .where(instrument_id: instrument_id)
              .where('start_date < ? AND end_date > ?', end_date, start_date)
              .none?
       errors.add(:message, "This instrument is booked on those dates")

      end
end

