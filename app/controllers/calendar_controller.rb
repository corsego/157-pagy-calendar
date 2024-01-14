class CalendarController < ApplicationController
  def index
    @current_week = (params[:date]&.to_date || Date.today).beginning_of_week
    @first_week = (@current_week - 4.weeks).beginning_of_week
    @last_week = (@current_week.end_of_week + 4.weeks).beginning_of_week
    week_range = @first_week..@last_week
    @weeks = week_range.map { |date| date.beginning_of_week }.uniq
  end
end
