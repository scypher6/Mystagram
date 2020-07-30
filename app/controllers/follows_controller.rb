class FollowsController < ApplicationController

    def create
        @following = User.find(params[:id])
        Follow.create(follower_id: current_user.id, following_id: @following.id)
    end



end