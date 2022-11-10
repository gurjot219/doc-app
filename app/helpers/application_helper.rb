module ApplicationHelper
  def parse_dates(date)
    Date.strptime(date.to_s, '%Y-%m-%d')
  end

  def is_log_in_page?
    request.fullpath.start_with?("/users") ||
    request.fullpath.start_with?("/patients/new")
  end

end
