class FollowsController < ApplicationController

    def create
        if already_followed?
            flash[:notice] = "Sorry can only like once"
        else #can follow the user
            @following = User.find(params[:id])
            Follow.create(follower_id: current_user.id, following_id: @following.id)
        end
        
        redirect_to @following
    end

    def destroy
        @following = User.find(params[:id])
        @follow = Follow.find_by(follower_id: current_user.id, following_id: @following.id)
        @follow.destroy

        redirect_to @following
    end



    private
    # Checks if a particular user was already followed
    def already_followed?
        Follow.where(follower_id: current_user.id, following_id: params[:id]).exists?
        # byebug
    end
end