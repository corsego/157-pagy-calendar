class ApplicationController < ActionController::Base
  include Pagy::Backend

  def pagy_calendar_period(collection)
    # collection.minmax.map(&:start_date)
    start_date = collection.min_by(&:start_date).start_date
    end_date = collection.max_by(&:start_date).start_date
    [start_date, end_date]
  end

  def pagy_calendar_filter(collection, from, to)
    collection.where(start_date: from..to)
  end
end
