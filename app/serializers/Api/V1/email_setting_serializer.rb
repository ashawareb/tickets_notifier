module Api
  module V1
    class EmailSettingSerializer < ActiveModel::Serializer
      attributes :id, :due_date_reminder_email_interval, :due_date_reminder_email_time
      :send_due_date_reminder_email

      def due_date_reminder_email_time
        object.due_date_reminder_email_time.strftime("%H:%M")
      end
    end
  end
end

