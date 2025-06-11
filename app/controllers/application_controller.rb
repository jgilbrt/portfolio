class ApplicationController < ActionController::Base
  before_action :set_page_label

  private

  def set_page_label
    @page_label = case "#{controller_name}##{action_name}"
                  when "pages#about"
                    "About"
                  when "projects#index"
                    "Projects"
                  when "contacts#create"
                    "Contact"
                  else
                    "Contact"
                  end
  end
end
