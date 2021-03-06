# == Schema Information
#
# Table name: devise_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  action     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DeviseLog < ActiveRecord::Base
  belongs_to :user

  def self.log(resource, new_action)
    return unless User.valid_user?(resource)
    resource.log_devise_action(new_action)
  end

end
