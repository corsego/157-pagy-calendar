class CalendarController < ApplicationController
  def month
    @date = Date.parse(params.fetch(:date, Date.today.to_s))
    @all_month = @date.all_month
    @events = Event.where(start_date: @all_month)
  end

  def week
  end

  def day
  end
end
