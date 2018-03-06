class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.build_event_picture
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
      if @event.save
          flash[:notice] = "added event!"
        redirect_to @event
      else
        render 'new'
      end
  end

  def update
    @event = Event.find(params[:id])
      if @event.update(event_params)
        flash[:notice] = "Updated event"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path, notice:"deleted faculty"
  end

  private
    def event_params
      params.require(:event).permit(:title, :url, :body, event_picture_attributes:
        [:id, :url, :name])
    end
end