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
require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
