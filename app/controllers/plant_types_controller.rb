class PlantTypesController < ApplicationController
    def index
        @plant_types = PlantType.all 
    end

    def show
        @plant_type = PlantType.find(params[:id])
    end
end
