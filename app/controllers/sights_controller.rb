class SightsController < ApplicationController
  before_action :set_sight, only: [:show, :edit, :update, :destroy]

  # GET /sights
  def index
    @sights = Sight.all
  end

  # GET /sights/1
  def show
  end

  # GET /sights/new
  def new
    @sight = Sight.new
  end

  # GET /sights/1/edit
  def edit
  end

  # POST /sights
  def create
    @sight = Sight.new(sight_params)

    if @sight.save
      redirect_to @sight, notice: 'Sight was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sights/1
  def update
    if @sight.update(sight_params)
      redirect_to @sight, notice: 'Sight was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sights/1
  def destroy
    @sight.destroy
    redirect_to sights_url, notice: 'Sight was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sight
      @sight = Sight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sight_params
      params.require(:sight).permit(:name, :date, :time, :trip_id)
    end
end
