# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  lname                  :string
#  fname                  :string
#  username               :string
#  unique_session_id      :string(20)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :session_limitable,
         :recoverable, :rememberable, :trackable, :validatable

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  def self.valid_user?(resource)
    resource && resource.kind_of?(User) && resource.valid?
  end

  def log_devise_action(new_action)
    DeviseLog.create(user: self, action: new_action)
  end

  def update_unique_session_id!(unique_session_id)
    log_devise_action('sign_out_from_another_browser') if self.unique_session_id != unique_session_id && self.unique_session_id
    self.unique_session_id = unique_session_id
    save(:validate => false)
  end

end
