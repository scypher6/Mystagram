class UsersController < ApplicationController

    def show
        @user = current_user
        @pics = Pic.all
    end
end