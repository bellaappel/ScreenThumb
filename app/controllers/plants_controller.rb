class PlantsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]
    def index
        if params[:order]
            @plants = Order.find(params[:order]).plants
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
        params.require(:plant).permit(:name, :species, :toxicity, :sunlight, order_id, order_attributes: [:order])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
