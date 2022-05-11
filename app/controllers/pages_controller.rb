class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @plants_samples = Plant.all.first(8)
  end
end
