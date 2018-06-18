class Api::StopsController < ApplicationController
  before_action :set_trip
  before_action :set_stop, except: [:index, :create]
  
  def index
    render json: @trip.stops
  end

  def create
    stop = Stop.new(stop_params)
    if stop.save
      render json: stop
    else
      render json: stop.errors
    end
  end

  def show
    render json: @stop
  end

  def update
    if stop.update(stop_params)
      render json: stop
    else
      render json: stop.errors
    end
  end

  def destroy
    @trip.destroy
  end

  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_stop
      @stop = Stop.find(params[:id])
    end

    def stop_params
      params.require(:stop).permit(:name, :address)
    end

end
