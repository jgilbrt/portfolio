class ContactMailer < ApplicationMailer
  default to: "jordan.gilbert@hotmail.co.uk"

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail(from: email, subject: "New Contact Form Message from #{name}")
  end
end
