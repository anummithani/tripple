class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @q = Trip.ransack(params[:q])
    @trips = @q.result(distinct: true).includes(:travellers, :restaurants,
                                                :sights, :trip_photos, :users).page(params[:page]).per(10)
  end

  def show
    @trip_photo = TripPhoto.new
    @sight = Sight.new
    @restaurant = Restaurant.new
    @traveler = Traveler.new
  end

  def new
    @trip = Trip.new
  end

  def edit; end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to @trip, notice: "Trip was successfully created."
    else
      render :new
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: "Trip was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: "Trip was successfully destroyed."
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:city, :country, :trip_name, :trip_image,
                                 :arrival_date, :departure_date)
  end
end
