class HomeController < ApplicationController
  def index
    session[:conversations] ||= []
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                          .find(session[:conversations])
  end
end

# We are including other models in @ conversations to avoid n+1 queries under @user queries we are displaying all users that are not us (in the chat list)
#It is much faster to issue 1 query which returns 100 results than to issue 100 queries which each return 1 result. 
#generating multiple queries being the N+1 query problem