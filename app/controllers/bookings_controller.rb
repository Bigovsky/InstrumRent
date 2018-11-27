class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(booking_params)
  end

  def new
    @booking = Booking.new
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    if @booking.save
      redirect_to instrument_path(@instrument)
    else
      render "instruments/show"
    end
  end

  # def edit
  #   @booking = Booking.find(booking_params)
  #   @booking.edit(booking_params)
  # end

  # def update
  #   @booking = Booking.find(booking_params)
  #   @booking.update(booking_params)
  # end

  def destroy
    @booking = Booking.find(booking_params)
    @booking.delete_at(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
