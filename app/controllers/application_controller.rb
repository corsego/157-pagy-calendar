class ApplicationController < ActionController::Base
  # enable pagy backend helpers globally
  include Pagy::Backend

  # start and end of calendar (first and last record in the list)
  def pagy_calendar_period(collection)
    # collection.minmax.map(&:start_date)
    start_date = collection.min_by(&:start_date).start_date
    end_date = Time.zone.now
    [start_date, end_date]
  end

  # query to paginate within start_date
  def pagy_calendar_filter(collection, from, to)
    collection.where(start_date: from..to)
  end
end
