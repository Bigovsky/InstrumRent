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


  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    @booking.user = current_user
    authorize @booking


      if @booking.save
      redirect_to bookings_path
    else if @booking.bookings_must_not_overlap
      render "new"
    else
      render "error"

  end
end
end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:instrument_id, :user_id, :start_date, :end_date, :price)
  end
end
