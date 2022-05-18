class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :destroy, :edit, :update]

  def index
    @plants = Plant.all
    @markers = User.all.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("planty_favicon.jpg")
      }
    end

    if params[:query].present?
      sql_query = "title ILIKE :query OR color ILIKE :query OR care_type ILIKE :query"
      @plants = Plant.where(sql_query, query: "%#{params[:query]}%")
    else
      @plants = Plant.all
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
      flash[:notice] = "Plant created!"
    else
      flash.now[:alert] = "Sorry, there was an issue!"
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
