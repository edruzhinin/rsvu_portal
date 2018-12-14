class EventsController < ApplicationController
	def new
  	@event = Event.new
  end
  
  def create
  	@event = Event.new(event_params)
  	@event.user=current_user
  	
  	if @event.save
			redirect_to events_path
		else
		
			render 'new'
		end 
	end
  
  def show
		@event = Event.find(params[:id])
		@reservations = @event.reservations
		
	end
	
	def edit
		@event = Event.find(params[:id])
	end
	
	def update
		
		@event = Event.find(params[:id])

		if @event.update_attributes(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end
	
	def index
		@events= Event.all
 		
 		
	end

  private
  
  	def event_params
			params.require(:event).permit(:name, :to_time, :from_time, :permanent)		
		end
		
		
end
