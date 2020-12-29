class PlantsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    def most_comments
        @plant = plant_with_most_comments
        render "show"
    end
    
    def index
        if params[:order_id]
            @plants = Order.find(params[:order_id]).plants
        else
            @plants = Plant.all 
        end
    end

    def show
            @plant = Plant.find(params[:id])
    end

    def new
        @plant = Plant.new
        # @plants = Plant.all
    end

    def create
        @plant = Plant.new(plant_params)
        if @plant.save
            redirect_to @plant
        else 
            render :new
        end
    end


    private
    def plant_params
        params.require(:plant).permit(:name, :species, :toxicity, :sunlight, :water, :propogation, :order_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
