module ApplicationHelper
  def days_of_week(date)
    date.beginning_of_week..date.end_of_week
  end
end
