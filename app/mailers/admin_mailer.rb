class AdminMailer < ApplicationMailer
  default from: "avion@trade.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.confirmation_approval.subject
  #
  def confirmation_approval(user)
    @user = user
    mail to: user.email, subject: "Confirmation Approval"
  end
end
