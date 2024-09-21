# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  time_zone  :string           default("Europe/Vienna")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :tickets
  has_one :email_setting, dependent: :destroy

  validates :name, :time_zone, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validate :time_zone_must_be_valid

  after_create :create_default_email_setting

  private

  def time_zone_must_be_valid
    if time_zone.present? && !ActiveSupport::TimeZone[time_zone]
      errors.add(:time_zone, 'Time Zone is not valid')
    end
  end

  def create_default_email_setting
    EmailSetting.create!(
      user: self,
      send_due_date_reminder_email: true,
      due_date_reminder_email_interval: 0,
      due_date_reminder_email_time: ActiveSupport::TimeZone[time_zone].parse('9:00:00')
    )
  end
end
