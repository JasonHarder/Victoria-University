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

    redirect_to events_path, notice:"Deleted Event"
  end

  private
    def event_params
      params.require(:event).permit(:title, :url, :body, event_picture_attributes:
        [:id, :url, :name])
    end
end

# permit_params :attr1, :attr2 ## Add this line

# ActiveAdmin.register Post do
#   permit_params :title, :content, :publisher_id, role_ids: []
# end
# Nested associations in the same form also require an array, but it needs to be filled with any attributes used.

# ActiveAdmin.register Post do
#   permit_params :title, :content, :publisher_id,
#     tags_attributes: [:id, :name, :description, :_destroy]
# end

# SEE ACTIVE ADMIN DOCS ON STRONG PARAMS WHICH IS THE ROOT OF THE ISSUE.
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters