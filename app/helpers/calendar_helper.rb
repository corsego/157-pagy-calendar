module CalendarHelper
  # http://localhost:3000/calendar/month?date=2023-08-01
  def month_offset(date)
    date.beginning_of_month.wday - 1
  end

  def today?(day)
    day == Date.today
  end

  def today_class(day)
    "bg-rose-200" if today?(day)
  end
end
