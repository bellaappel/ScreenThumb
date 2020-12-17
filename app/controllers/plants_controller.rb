class PlantsController < ApplicationController
    def index
        if params[:plant_type_id]
            @plants = PlantType.find(params[:plant_type_id]).plants
        else
            @plants = Plant.all 
        end
    end

    def show
        @plant = Plant.find(params[:id])
    end

    def new
        @plant = Plant.new
        @plants = Plant.all
    end

    def create
        @plant = Plant.create(plant_params)
        redirect_to @plants
    end


    private
    def plant_params
        params.require(:plant).permit(:name, :species, :toxicity, :sunlight, plant_type_id, plant_type_attributes: [:type])
    end

end
