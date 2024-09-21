module Notification
  module Email
    class SendTicketDueToReminderEmail
      def initialize(ticket)
        @ticket = ticket
        @user = ticket.user
        @time_zone = @user.time_zone
        @send_due_date_reminder_email = @user.email_setting&.send_due_date_reminder_email
        @due_date_reminder_email_interval = @user.email_setting&.due_date_reminder_email_interval
        @due_date_reminder_email_time = @user.email_setting&.due_date_reminder_email_time
      end

      def call
        notification_datetime = send_datetime
        TicketDueToEmailReminderJob.perform_at(notification_datetime, @ticket.id)
      end

      #private

      def send_datetime
        send_time = @due_date_reminder_email_time.strftime("%H:%M")
        ticket_due_date = @ticket.due_date
        current_max_interval = (ticket_due_date - Date.today).to_i

        send_date = if @due_date_reminder_email_interval > current_max_interval
                      ticket_due_date - @due_date_reminder_email_interval
                    else
                      ticket_due_date
                    end

        ActiveSupport::TimeZone[@time_zone].parse("#{send_date} #{send_time}").in_time_zone("UTC")
      end
    end
  end
end
