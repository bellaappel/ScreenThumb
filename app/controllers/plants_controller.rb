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

    def edit 
    end
    
    def update
        @plant = Plant.find_by(id: params[:id])
        @plant.update(plant_params)
    end

    def destroy
        @plant.destroy
        redirect_to plants_url, notice: 'Plant was successfully sucessfully deleted.'
    end


    private
    def plant_params
        params.require(:plant).permit(:img, :name, :species, :toxicity, :sunlight, :water, :propogation, :order_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
