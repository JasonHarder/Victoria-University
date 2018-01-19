class ApplicationController < ActionController::Base
  before_action :load_conversations
  
  @users = User.all

  def after_sign_in_path_for(resource)
    '/'
  end

   private 

   def load_conversations
  @conversations = Conversation.all 
  end

  protect_from_forgery with: :exception
end

#possibly add a before action here for user authentication.
