class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.videogame_install_notification.subject
  #
  def videogame_install_notification(profile)
    @profile = profile
    mail to: @profile.email, subject: "test!"
  end
end
