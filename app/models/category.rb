# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base

  has_many :account_transactions

  scope :select_all_incomes, -> {
    joins('LEFT JOIN account_transactions ON account_transactions.category_id = categories.id')
        .select_incomes
  }

  scope :select_ranged_incomes, -> (since, till) {
    joins("LEFT JOIN account_transactions ON account_transactions.category_id = categories.id AND account_transactions.created_at >= #{Category.sanitize(since)} AND account_transactions.created_at <= #{Category.sanitize(till)}")
        .select_incomes
  }

  scope (:select_incomes), -> {
    group(:id)
        .select('categories.id, MAX(name) category_name, COALESCE(SUM(value),0) difference, SUM(case when value < 0 then value else 0 end) outcome, SUM(case when value > 0 then value else 0 end) income')
  }

end
