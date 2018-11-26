class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[STRONG_PARAMS])
  end

  def new
  end

  def create
    @booking = Booking.new(params[CONFIRM])
    @booking.save
  end

  def edit
  end

  def update
    @booking = Booking.find(params[STRONG_PARAMS])
    @booking.update(params[CONFIRM])
  end

  def destroy
  end

  def STRONG_PARAMS
  end

  def CONFIRM
  end
end
