class ApplicationController < ActionController::Base
    helper_method :current_user, :user_is_logged_in?, :current_user_id, :plant_with_most_comments

    def current_user
        User.find_by_id(session[:user_id])
    end

    def current_user_id
        if user_is_logged_in?
            session[:user_id]
        end
    end

    def user_is_logged_in?
        !!session[:user_id]
    end
        
    def home
        render '/home'
    end

    def own_plant?
    end

    def plant_with_most_comments
        plants = Plant.all
        most_commented_plant = Plant.find(1)
        plants.each do |plant|
            if plant.comments.count > most_commented_plant.comments.count
                most_commented_plant = plant
            end
        end
        return most_commented_plant
    end

end
