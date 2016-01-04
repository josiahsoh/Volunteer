class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :delete, :update ]

  def index
  	@events = Event.all
  end

  def show
    @photos =@event.photos
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      
      params[:images]
      params[:images].each do |image|
        @event.photos.create(image: image)
    end

      @photos = @event.photos
      redirect_to edit_event_path(@event), notice: "Saved..."
    else 
      render :new
    end
  end

  def edit
    # if current_user.id == @event.user.id
      @photos = @event.photos
  end

  def destroy
  	set_event #Why have to put set_event?
    @event.destroy

    flash.notice = "Event '#{@event.title}' has been deleted!"
    redirect_to events_path
  end

  def update		
    set_event																																			
  	if @event.update(event_params)

      if params[:images]
        params[:images].each do |image|
          @event.photos.create(image: image)
        end
      end

      redirect_to event_path(@event), notice: "Updated...."
    else
      render :edit
    end 
  end

  private
	  def set_event
	  	@event = Event.find(params[:id])
	  end

	  def event_params
	    params.require(:event).permit(:organization_id, :title, :description, :date_type, :start_date, 
        :end_date, :address, :city, :state, :country, :num_of_volunteer, :dateline, :requirements, :animals,
        :sports, :arts_and_culture, :technology, :education, :children_and_youth, :community, :environment, 
        :homeless_and_housing, :women, :seniors, :disaster_relief, :health, :immigratnts_refugees, :special_events )
	  end
end