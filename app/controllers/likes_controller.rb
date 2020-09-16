class LikesController < ApplicationController
    before_action :find_post

    def create
        if already_liked?
            flash[:notice] = "Sorry, can't like more than once!"
          else #can like
            @pic.likes.create(user_id: current_user.id)
            redirect_to pic_path(@pic)
        end
    end

    def destroy
        @like = Like.find_by(user_id: current_user.id)
        @like.destroy

        redirect_to pic_path(params[:pic_id])
    end

    private

    def find_post
        @pic = Pic.find(params[:pic_id])
    end

    #check if a picture was already like
    def already_liked?
        Like.where(user_id: current_user.id, pic_id:
        params[:pic_id]).exists?
    end
end
