class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def send_contact
    flash[:notice] = "Thanks for reaching out! I'll get back to you soon."
    redirect_to contact_path
  end
end
