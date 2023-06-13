class FishingTripController < ApplicationController

  # IMPORTANT subject to change based on how the view is design without a fishing trip and how it will be shown.

  def new
    @fishing_trip = FishingTrip.new
    authorize @fishing_trip
  end

  def show
    @fishing_trip = FishingTrip.find(params[:id])
    authorize @fishing_trip
  end

end
