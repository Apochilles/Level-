# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/videogame_install_notification
  def videogame_install_notification
    ModelMailer.videogame_install_notification
  end

end
