class FollowsController < ApplicationController

    def create
        if already_followed?
            flash[:notice] = "Sorry can only like once"
        else
            @following = User.find(params[:id])
            Follow.create(follower_id: current_user.id, following_id: @following.id)
        end
    end



    private

    def already_followed?
        Follow.where(follower_id: current_user.id, following_id: params[:id]).exists?
        # byebug
    end
end