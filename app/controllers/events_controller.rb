class EventsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  	  user = @event.user
  	  user.share(@event)
  	  flash[:success] = "Event created!"
  	  redirect_to root_url
  	else
  	  flash[:error] = "There was a problem saving your event"
  	  redirect_to root_url
  	end
  end

  def sharers
  	@event = Event.find(params[:id])
  	@users = @event.sharers.paginate(page: params[:page])
  	respond_to do |format|
  	  format.json { render json: @users }
  	end
  end

  def destroy
  	user = @event.user
  	@event.destroy
  	flash[:success] = "Event deleted"
  	redirect_to user
  end

  def show
  	@event = Event.find(params[:id])
  	respond_to do |format|
      format.html #{ redirect_to @user }
      format.json { render json: @event }
      format.js
    end
  end

  private 

  	def event_params
  	  params.require(:event).permit(:name, :description, :location, :startTime, :endTime, :picture)
  	end

  	def correct_user
  	  @event = current_user.events.find_by(id: params[:id])
  	  redirect_to root_url if @event.nil?
  	end
end
