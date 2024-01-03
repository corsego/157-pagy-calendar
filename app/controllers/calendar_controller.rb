class CalendarController < ApplicationController
  def index
  end

  def timeline
    @direction = params[:direction]
    @month_year = params[:month_year].present? ? Date.parse(params[:month_year]) : Date.today

    case @direction
    when "past"
      @month_year -= 1.month
    end

    @date = @month_year.beginning_of_month
    # @calendar_data = Journal::Timeline.new(start_date: @date, bucket: @bucket).calendar_data

    case @direction
    when "past"
      @month_year -= 1.month
    else
      @month_year += 1.month
    end
  end
end