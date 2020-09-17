class UsersController < Devise::ApplicationController

    def show
        # @user = current_user
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if (@user.update(user_params)) #if user exits update them
            redirect_to edit_user_registration_path
        else
            render "edit"
        end
        # byebug

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :picture)
    end

end