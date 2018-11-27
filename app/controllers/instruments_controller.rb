class InstrumentsController < ApplicationController
  def index
    @instruments = policy_scope(Instrument).order(created_at: :desc)
    authorize @instruments
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to @instrument
    else
      render 'new'
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    authorize @instrument
    if @instrument.save
      redirect_to @instrument
    else
      render 'edit'
    end
  end

  private

  def instrument_params
    params.require(:instrument)
          .permit(
            :name,
            :description,
            :location,
            :price,
            :category,
            :photo
          )
  end
end
