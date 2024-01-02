module ApplicationHelper
  def days_of_week(date)
    date.beginning_of_week..date.end_of_week
  end

  def days_of_month(date)
    date.beginning_of_month..date.end_of_month
  end

  def month_offset(date)
    date.beginning_of_month.wday - 1
  end
end
