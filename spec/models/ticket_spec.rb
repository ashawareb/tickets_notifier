require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:user) { User.create(email: 'test@example.com', name: 'name') }
  let(:ticket) { Ticket.new(title: 'Sample Ticket', description: 'Ticket Description', user: user, due_date: Date.today) }

  describe 'associations' do
    it 'belongs to a user' do
      expect(ticket.user).to eq(user)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(ticket).to be_valid
    end

    it 'is not valid without a title' do
      ticket.title = nil
      expect(ticket).not_to be_valid
    end

    it 'is not valid without a description' do
      ticket.description = nil
      expect(ticket).not_to be_valid
    end

    it 'is not valid without a user' do
      ticket.user = nil
      expect(ticket).not_to be_valid
    end

    it 'is not valid with a past due date' do
      ticket.due_date = Date.yesterday
      expect(ticket).not_to be_valid
      expect(ticket.errors[:due_date]).to include('Ticket Due Date cannot be in the past')
    end
  end

  describe 'enums' do
    it 'defines status enums' do
      expect(Ticket.statuses).to include('to_do', 'in_progress', 'done')
    end

    it 'defines reminder_status enums' do
      expect(Ticket.reminder_statuses).to include('scheduled', 'sent', 'failed')
    end
  end
end
