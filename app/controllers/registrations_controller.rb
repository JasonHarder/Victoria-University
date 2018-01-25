class RegistrationsController < ApplicationController
   before_action :limit_users_registered
  
  def limit_users_registered
    if (User.count == 5) & user_signed_in?
      redirect_to root_path
    else 
      redirect_to new_user_session_path
    end 
  end
end
