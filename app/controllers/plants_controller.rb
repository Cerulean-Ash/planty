class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :destroy, :edit, :update]

  def index
    @plants = Plant.all
    @markers = User.all.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    @purchase = Purchase.new
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(
      :title,
      :price_per_clipping,
      :description,
      :number_of_clippings,
      :color,
      :care_type,
      photos: []
    )
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
