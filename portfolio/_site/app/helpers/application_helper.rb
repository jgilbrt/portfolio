module ApplicationHelper
  def page_label
    case "#{controller_name}##{action_name}"
    when "home#index"
      "PORTFOLIO"
    when "projects#index"
      "PROJECTS"
    when "contact#new"
      "CONTACT"
    when "about#index"
      "ABOUT"
    else
      "PAGE"
    end
  end
end
