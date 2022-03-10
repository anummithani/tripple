class SightsController < ApplicationController
  before_action :set_sight, only: %i[show edit update destroy]

  def index
    @q = Sight.ransack(params[:q])
    @sights = @q.result(distinct: true).includes(:trip).page(params[:page]).per(10)
  end

  def show; end

  def new
    @sight = Sight.new
  end

  def edit; end

  def create
    @sight = Sight.new(sight_params)

    if @sight.save
      message = "Sight was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @sight, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @sight.update(sight_params)
      redirect_to @sight, notice: "Sight was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sight.destroy
    message = "Sight was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to sights_url, notice: message
    end
  end

  private

  def set_sight
    @sight = Sight.find(params[:id])
  end

  def sight_params
    params.require(:sight).permit(:name, :datetime, :trip_id)
  end
end
