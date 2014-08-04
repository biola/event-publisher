class EventsController < ApplicationController
  include ActivityLoggable

  before_filter :set_event, only: [:show, :edit, :update]
  before_filter :new_event_from_params, only: [:new, :create]
  before_filter :pundit_authorize
  respond_to :html, :json

  def index
    @events = policy_scope(Event).page(params[:page]).per(15)
  end

  def show
    redirect_to edit_event_path @event
  end

  def new
  end

  def create
    if @event.save
      log_activity(@event.previous_changes, parent: @event)
      flash[:info] = 'Event was successfully created.'
      redirect_to edit_event_path @event
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      log_activity(@event.previous_changes, parent: @event)
      flash[:info] = 'Event changes were saved.'
      redirect_to edit_event_path @event
    else
      render :edit
    end
  end

  private

  def new_event_from_params
    if params[:event]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  def event_params
    params.require(:event).permit( :title, :subtitle, :slug, :location, :occurrences, :start_date, :end_date, :teaser, :summary, :audience, :categories, :image, :published, :contact_name, :contact_email, :contact_phone, :sponsor, :sponsor_site, :admission_info, :registration_info, :map_url )
  end

  def set_event
    @event = Event.find(params[:id]) if params[:id]
  end

  def pundit_authorize
    authorize (@event || Event)
  end
end
