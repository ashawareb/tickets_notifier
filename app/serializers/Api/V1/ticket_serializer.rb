module Api
  module V1
    class TicketSerializer < ActiveModel::Serializer
      attributes :id, :title, :description, :due_date, :status, :reminder_status
    end
  end
end

