module ApplicationHelper
  def parse_dates(date)
    Date.strptime(date.to_s, '%Y-%m-%d')
  end
end
