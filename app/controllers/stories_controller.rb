class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :delete, :update ]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def show
    @photos =@story.photos
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      
      params[:images]
      params[:images].each do |image|
        @story.photos.create(image: image)
    end

      @photos = @story.photos
      redirect_to edit_story_path(@story), notice: "Saved..."
    else 
      render :new
    end
  end

  def edit
    # if current_user.id == @event.user.id
      @photos = @story.photos
  end

  def destroy
  	set_story #Why have to put set_event?
    @story.destroy

    flash.notice = "Story '#{@story.title}' has been deleted!"
    redirect_to stories_path
  end

  def update		
    set_story																																			
  	if @story.update(story_params)

      if params[:images]
        params[:images].each do |image|
          @story.photos.create(image: image)
        end
      end

      redirect_to story_path(@story), notice: "Updated...."
    else
      render :edit
    end 
  end

  private
    def set_event
	  @story = Story.find(params[:id])
	end

	def story_params
	  params.require(:story).permit(:user_id, :title, :body )
	end
end