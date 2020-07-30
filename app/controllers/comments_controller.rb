class CommentsController < ApplicationController

    def create
        @pic = Pic.find(comments_params[:pic_id])
        @comment = Comment.create(comments_params)
        redirect_to pic_path(@pic)
    end

    def comments_params
        params.require(:comment).permit(:content, :pic_id, :user_id)
    end
end
