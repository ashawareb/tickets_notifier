# == Schema Information
#
# Table name: email_settings
#
#  id                               :integer          not null, primary key
#  due_date_reminder_email_interval :integer          default(0)
#  due_date_reminder_email_time     :time             default(Sat, 01 Jan 2000 09:00:00.000000000 UTC +00:00)
#  send_due_date_reminder_email     :boolean          default(TRUE)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  user_id                          :integer
#
# Indexes
#
#  index_email_settings_on_user_id  (user_id)
#
class EmailSetting < ApplicationRecord
  belongs_to :user
end
