class Api::TripsController < ApplicationController
 
  def index
    render json: Trip.dump
  end

  def show
    trip = Trip.find(params[:id])
    render json: trip
  end
end
