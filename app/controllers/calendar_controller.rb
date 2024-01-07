class CalendarController < ApplicationController
  def index
  end

  def day
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @next_date = @date + 1.day
    @prev_date = @date - 1.day
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def week
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events = Event.where(start_date: @date.beginning_of_week..@date.end_of_week)
    # the params in the url should be 1 week back
    @last_week_date = (@date - 1.week).beginning_of_week
    @next_week_date = (@date + 1.week).beginning_of_week
  end

  def month
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events = Event.where(start_date: @date.beginning_of_month..@date.end_of_month)
    # the params in the url should be 1 month back
    @last_month_date = (@date - 1.month).beginning_of_month
    @next_month_date = (@date + 1.month).beginning_of_month
  end
end