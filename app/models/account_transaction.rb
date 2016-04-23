# == Schema Information
#
# Table name: account_transactions
#
#  id          :integer          not null, primary key
#  account_id  :integer
#  user_id     :integer
#  purpose     :string
#  value       :float
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AccountTransaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  belongs_to :category

  delegate :email, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :category, prefix: true

  def self.create_by_params(account, user, params)
    acc_trans = new(params.merge(user: user, account: account))
    transaction do
      account.change_value(acc_trans.value)
      acc_trans.save
    end
    acc_trans
  end

end
