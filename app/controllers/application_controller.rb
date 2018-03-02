class ApplicationController < ActionController::Base
  before_action :load_conversations
  before_action :load_messages
  before_action :load_users
  before_action :load_pictures

  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end


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

  def load_users
    @users = User.all
  end

  def load_pictures
  # @pictures = Picture.all
  end


  protect_from_forgery with: :exception
end
