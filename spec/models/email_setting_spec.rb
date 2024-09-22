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
require 'rails_helper'

RSpec.describe EmailSetting, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      email_setting = EmailSetting.new
      association = EmailSetting.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    let(:email_setting) { EmailSetting.new }

    it 'is valid with valid attributes' do
      email_setting.user = User.new(name: 'John Doe', email: 'john@example.com')
      email_setting.due_date_reminder_email_interval = 0
      email_setting.due_date_reminder_email_time = '09:00'
      expect(email_setting).to be_valid
    end

    it 'is not valid without a due_date_reminder_email_interval' do
      email_setting.due_date_reminder_email_interval = nil
      expect(email_setting).not_to be_valid
      expect(email_setting.errors[:due_date_reminder_email_interval]).to include("can't be blank")
    end

    it 'is not valid without a due_date_reminder_email_time' do
      email_setting.due_date_reminder_email_time = nil
      expect(email_setting).not_to be_valid
      expect(email_setting.errors[:due_date_reminder_email_time]).to include("can't be blank")
    end
  end
end
