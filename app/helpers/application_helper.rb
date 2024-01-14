module ApplicationHelper
  def month_offset(date)
    date.beginning_of_month.wday - 1
  end

  def today_bg(date)
    return 'bg-rose-400' if date.to_s == Date.today.strftime('%Y-%m-%d')
    
    'bg-rose-300'
  end
end
