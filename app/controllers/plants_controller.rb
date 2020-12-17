class PlantsController < ApplicationController
    def index
        @plants = Plant.all 
    end

    def show
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
