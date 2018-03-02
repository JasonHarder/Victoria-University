class CampusController < ApplicationController
  def index
    @users = User.all
  end
end
