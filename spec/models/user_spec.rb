require 'rails_helper'

RSpec.describe User, type: :model do
  # Test for associations
  describe 'associations' do
    it 'has many tickets' do
      user = User.reflect_on_association(:tickets)
      expect(user.macro).to eq(:has_many)
    end

    it 'has one email_setting' do
      user = User.reflect_on_association(:email_setting)
      expect(user.macro).to eq(:has_one)
    end
  end

  # Test for validations
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John Doe', email: 'john@example.com', time_zone: 'Europe/Vienna')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email: 'john@example.com', time_zone: 'Europe/Vienna')
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'John Doe', time_zone: 'Europe/Vienna')
      expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      User.create(name: 'John Doe', email: 'john@example.com', time_zone: 'Europe/Vienna')
      duplicate_user = User.new(name: 'Jane Smith', email: 'john@example.com', time_zone: 'America/New_York')
      expect(duplicate_user).not_to be_valid
    end

    it 'is not valid with an invalid email format' do
      user = User.new(name: 'John Doe', email: 'invalid_email', time_zone: 'Europe/Vienna')
      expect(user).not_to be_valid
    end

    it 'is not valid without a time_zone' do
      user = User.new(name: 'John Doe', email: 'john@example.com', time_zone: nil)  # Explicitly set time_zone to nil
      expect(user).not_to be_valid
      expect(user.errors[:time_zone]).to include("can't be blank")
    end

    it 'is not valid with an invalid time_zone' do
      user = User.new(name: 'John Doe', email: 'john@example.com', time_zone: 'Invalid/Timezone')
      expect(user).not_to be_valid
    end
  end

  # Test for callbacks
  describe 'callbacks' do
    it 'creates a default email setting after user creation' do
      user = User.create!(name: 'John Doe', email: 'john@example.com', time_zone: 'Europe/Vienna')
      expect(user.email_setting).to be_present
      expect(user.email_setting.send_due_date_reminder_email).to be true
    end
  end
end
