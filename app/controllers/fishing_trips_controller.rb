class FishingTripsController < ApplicationController

  def new
    @fishing_trip = FishingTrip.new
    authorize @fishing_trip
  end

  def create
    @fishing_trip = FishingTrip.new(fishing_trip_params)
    @fishing_trip.user = current_user
    authorize @fishing_trip
    if @fishing_trip.save
      # redirect_to fishing_trip_path(@fishing_trip)
      render json: { message: @fishing_trip.name.to_json, status: :created }
    else
      render :new, status: :unprocessable_entity
      # render json: { message: @fishing_trip.name.to_json, status: :created }
    end
  end

  def show
    @fishing_trip = FishingTrip.find(params[:id])
    authorize @fishing_trip
  end

  private

  def fishing_trip_params
    params.require(:fishing_trip).permit(:name)
  end
end
