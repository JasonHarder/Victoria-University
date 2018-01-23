class ApplicationController < ActionController::Base
  before_action :load_conversations
  before_action :load_messages
  
  @users = User.all

  def after_sign_in_path_for(resource)
    '/'
  end

  private 

  def load_conversations
  @conversations = Conversation.all 
  end

  def load_messages
    @messages = Message.all
  end  

  protect_from_forgery with: :exception
end
