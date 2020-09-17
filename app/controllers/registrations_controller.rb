class RegistrationsController < Devise::RegistrationsController

    protected
  
      def after_update_path_for(resource)
        #redirect to edit page, instead of index by default
        # see: https://github.com/heartcombo/devise/wiki/How-To:-Customize-the-redirect-after-a-user-edits-their-profile
        edit_user_registration_path(resource)
      end
  end