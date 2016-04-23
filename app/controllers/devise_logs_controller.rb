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

class DeviseLogsController < ApplicationController

  #everyone
  def index
    @devise_logs = DeviseLog.where(user: current_user)
  end

end
