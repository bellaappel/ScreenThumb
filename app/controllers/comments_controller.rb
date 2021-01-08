class CommentsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    def index
        if params[:plant_id] 
            @comments = Plant.find(params[:plant_id]).comments
        else
            @comments = Comment.all
        end
    end

    def show
        @comment = Comment.find(params[:id])
        @plant = @comment.plant
    end

    def new
        if params[:plant_id]
            @comment = Comment.new(plant_id: params[:plant_id])
        else 
            @comment = Comment.new
        end
    end

    def edit
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to @comment, notice: "Comment was sucessfully created."
        else
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:title, :content, :plant_id, :user_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end




end
