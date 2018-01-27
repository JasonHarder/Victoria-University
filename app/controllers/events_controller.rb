class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = event.find(params[:id])
  end

  def new
  end 

  def create
    @event = Event.new(event_params)
   
      if @event.save
        redirect_to @event
      else
        render 'new'
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def event_params
    params.require(:event).permit(:title, :url, :body)
  end 

end
