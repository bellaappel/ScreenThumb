class PlantTypesController < ApplicationController
    def index
        @plant_types = PlantType.all 
    end
