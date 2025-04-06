module ApplicationHelper
  def status_color(status)
    case status
    when "Not Started"
      "secondary"
    when "In Progress"
      "primary"
    when "On Hold"
      "warning"
    when "Completed"
      "success"
    else
      "light"
    end
  end
end
