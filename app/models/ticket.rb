# == Schema Information
#
# Table name: tickets
#
#  id              :integer          not null, primary key
#  description     :text
#  due_date        :date
#  reminder_status :integer          default("scheduled")
#  status          :integer          default("to_do")
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_tickets_on_user_id  (user_id)
#
class Ticket < ApplicationRecord
  enum status: {
    to_do: 1,
    in_progress: 2,
    done: 3
  }
  enum reminder_status: {
    scheduled: 1,
    sent: 2,
    failed: 3
  }

  belongs_to :user

  validates :title, :description, :user, presence: true
  validate :due_date_availability


  private

  def due_date_availability
    if due_date < Date.today
      errors.add(:due_date, 'Ticket Due Date cannot be in the past')
    end
  end
end
