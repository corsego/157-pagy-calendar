class CalendarController < ApplicationController
  def week
    @date = if params[:date].present?
      Date.parse(params[:date]).beginning_of_week
    else
      Date.today.beginning_of_week
    end
    @next = @date + 1.week
    @prev = @date - 1.week
    @direction = params[:direction]
  end
end
