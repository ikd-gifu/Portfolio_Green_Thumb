class PlantBasicDataController < ApplicationController
  def index
    @plant_basic_data = PlantBasicDatum.all
  end
end
