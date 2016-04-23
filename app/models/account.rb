# == Schema Information
#
# Table name: accounts
#
#  id             :integer          not null, primary key
#  name           :string
#  value          :float
#  critical_value :float
#  notification   :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Account < ActiveRecord::Base

  has_many :account_transactions

  before_create :initialize_value

  def initialize_value
    self.value = 0
  end

  def change_value(difference)
    self.value += difference
    self.save
    AccountNotificationMailer.notification_mail(self).deliver_now if self.value < critical_value && difference < 0 && self.notification
  end

end
