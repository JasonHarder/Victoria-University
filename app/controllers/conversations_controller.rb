

  def close
    @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end
class ConversationsController < ApplicationController
 
  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])

    add_to_conversations unless conversated?

    respond_to do |format|
      format.js
    end
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    # put a redirect_to here
end