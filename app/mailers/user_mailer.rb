class UserMailer < ApplicationMailer

  def send_mail(pet)
    mail(:to => "#{pet.user.email}", subject: "Your refill is ready")
  end

end