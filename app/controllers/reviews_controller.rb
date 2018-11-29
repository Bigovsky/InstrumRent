class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @booking
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @instrument = @booking.instrument
    authorize @review
    if @review.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
