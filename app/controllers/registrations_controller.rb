class RegistrationsController < Devise::RegistrationsController
    before_action :limit_users, only: [:new, :create]

    protected

    def limit_users
        if ((User.count == 5) & (user_signed_in?))
            redirect_to root_path
        elsif User.count ==5
            redirect_to new_user_session_path
        end
    end 
end
