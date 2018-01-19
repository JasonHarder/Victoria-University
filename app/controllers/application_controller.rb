class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception
end

#possibly add a before action here for user authentication.
