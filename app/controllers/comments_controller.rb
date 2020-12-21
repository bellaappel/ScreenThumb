class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
    end

    def edit
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]

        if @comment.save
            redirect_to @comment, notice: "Comment was sucessfully created."
        else
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:title, :content, :plant_id)
    end



end