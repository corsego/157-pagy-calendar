class CalendarController < ApplicationController
  def index
    @current_week = (params[:date]&.to_date || Date.today).beginning_of_week
    @start_week = @current_week - 4.weeks
    @end_week = @current_week.end_of_week + 4.weeks
    @prev_page = @start_week - 1.week
    @week_range = @start_week..@end_week
    @weeks = @week_range.map { |date| date.beginning_of_week }.uniq
  end
end
