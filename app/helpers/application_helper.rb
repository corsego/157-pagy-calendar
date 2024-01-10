module ApplicationHelper
  def month_offset(date)
    date.beginning_of_month.wday - 1
  end
end
