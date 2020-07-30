class PicsController < ApplicationController
    before_action :find_pic, only: [:show, :edit, :update, :destroy]

    def index
        @pics = Pic.all
    end

    def show 
        @comment = Comment.new
        @like = Like.find_by(pic_id: @pic.id, user_id: current_user.id)
    end

    def new
       @pic = current_user.pics.build
    end

    def create
        @pic = current_user.pics.build(pic_params)

        if (@pic.save)
            redirect_to @pic, notice: "The picture has been posted!"
        else
            render "new"
        end
    end

    def edit
    end

    def update
    
        if (@pic.update(pic_params))
            redirect_to @pic, notice: "The picture was updated!"
        else
            render "edit"
        end
    end

    def destroy
            @pic.destroy
            redirect_to root_path
    end

private

    def pic_params
        params.require(:pic).permit(:title, :description, :image, comments_attributes: [:content])
    end

    def find_pic
        @pic = Pic.find(params[:id])
    end
end
