module ApplicationHelper
  def navbar_title
    case "#{controller_path}##{action_name}"
    when "tasks#index"
      "Dashboard"
    when "users/registrations#edit"
      "Profile"
    else
      "Task Management System" # Default title
    end
  end
end
