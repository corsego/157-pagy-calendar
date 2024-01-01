class CalendarController < ApplicationController
  def index
  end

  def week
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events = Event.where(start_date: @date.beginning_of_week..@date.end_of_week)
    # the params in the url should be 1 week back
    @last_week_date = (@date - 1.week).beginning_of_week
    @next_week_date = (@date + 1.week).beginning_of_week
  end
end