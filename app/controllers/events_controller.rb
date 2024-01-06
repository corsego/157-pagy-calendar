class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    # @events = Event.all
    collection = Event.all.order(start_date: :asc)
    @calendar, @pagy, @events = pagy_calendar(collection,
      year:  { size:  [1, 1, 1, 1] },
      month:  { size: [0, 12, 12, 0], format: '%b' },
      week:  { size: [0, 53, 53, 0], format: '%W' },
      day:  { size: [0, 31, 31, 0], format: '%d' },
      pagy:  { items: 10 }, # items per page
      active: !params[:skip]
    )
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
        format.html do
          flash[:notice] = "Event was successfully created."
          redirect_to event_url(@event)
          # redirect_to events_path(pagy_calendar_url_at(@calendar, @event.start_date))
        end
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

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :start_date)
  end
end
