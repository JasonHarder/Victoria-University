class EventsController < ApplicationController

  def index
    @events = Event.all &&@pictures = Picture.all
  end

  def show
    @event = Event.find(params[:id]) && @picture = Picture.find(params[:id])
  end

  def new
    @event = Event.new && @picture = Picture.new
  end

  def edit
    @event = Event.find(params[:id]) && @picture = Picture.find(params[:id])
  end

  def create
    @event = Event.new(event_params) && @picture = Picture.new(picture_params)

    if @event.save || @picture.save
      redirect_to @event
    else
      render 'new'
    end

  def update
    @event = Event.find(params[:id]) && @picture = Picture.find(params[:id])

    if @event.update(event_params) || @picture.update(picture_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id]) && @picture = Picture.find(params[:id])
    @event.destroy && @picture.destroy

    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :url, :body)
    end

    def picture_params
      params.require(:picture).permit(:name, :url)
    end
  end
end
