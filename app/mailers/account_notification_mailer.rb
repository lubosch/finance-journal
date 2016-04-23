class AccountNotificationMailer < ApplicationMailer
  default from: 'notifications@finance-journal.com'

  def notification_mail(account)
    @account = account
    mail(to: ENV['EMAIL_ADDRESS'], subject: 'Critical limit reached')
  end

end