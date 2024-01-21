class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_calendar, only: %i[ index create update]

  def index
    # @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        # debugger
        format.html { redirect_to helpers.pagy_calendar_url_at(@calendar, @event.start_date), notice: "Event was successfully created." }
        # format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
    end
  end

  private

  def set_calendar
    collection = Event.all
    @calendar, @pagy, @events = pagy_calendar(collection,
    year:  { size:  [1, 1, 1, 1] },
    # week: { size: 53, format: "%W" },
    month: { size: 12, format: "%b" },
    day: { size: 31, format: "%d" },
    pagy:  { items: 10 },
    active: !params[:skip])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :start_date)
  end
end
