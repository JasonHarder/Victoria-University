class PicturesController < ApplicationController
  def index
    @event_pictures = Event_picture.all
  end

  def show
    @event_picture = Event_picture.find(params[:id])
  end

  def new
    @event_picture = Event_picture.new
  end

  def edit
    @event_picture = Event_picture.find(params[:id])
  end

  def create
    @event_picture = Event_picture.new(event_picture_params)

    if  @event_picture.save
      redirect_to @event_picture
    else
      render 'new'
    end
  end

  def update
  @picture = Event_Picture.find(params[:id])

    if  @event_picture.update(event_picture_params)
      redirect_to event_pictures_path
    else
      render 'edit'
    end
  end

  def destroy
    @event_picture = Event_picture.find(params[:id])
    @event_picture.destroy
      redirect_to pictures_path
  end

  private

  def event_picture_params
      params.require(:event_picture).permit(:name, :url , :_delete)
  end
end