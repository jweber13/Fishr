class FishingTripsController < ApplicationController
  def create
    @fishing_trip = FishingTrip.new(fishing_trip_params)
    @fishing_trip.user = current_user
    @fishing_trip.save
    authorize @fishing_trip
  end

  def show
    @fishing_trip = FishingTrip.find(params[:id])
    authorize @fishing_trip
  end

  private

  def fishing_trip_params
    params.require(:job).permit(:user, :name)
  end
end
