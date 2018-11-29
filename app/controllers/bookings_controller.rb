class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @myinst = policy_scope(Instrument).select { |ins| ins.user == current_user }
  end

  def show
    @booking = Booking.find(params[:id])
    @reviews = policy_scope(Review)
    authorize @booking
  end

  def new
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new
    @booking.instrument = @instrument
    @booking.user = current_user
    authorize @booking
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to instrument_path(@instrument)
    else
      render "show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
