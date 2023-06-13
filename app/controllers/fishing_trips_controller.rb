class FishingTripsController < ApplicationController
  def new
    @fishing_trip = FishingTrip.new
    authorize @fishing_trip
  end

  def show
    @fishing_trip = FishingTrip.find(params[:id])
    authorize @fishing_trip
  end
end
