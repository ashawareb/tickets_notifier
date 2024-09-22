class TicketDueToEmailReminderJob
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)
    TicketMailer.reminder(ticket).deliver_now
    begin
      TicketMailer.reminder(ticket).deliver_now
      ticket.update_column(:reminder_status, 'sent')
    rescue StandardError => e
      ticket.update_column(:reminder_status, 'failed')
      puts "Email sending failed: #{e.message}"
    end
  end
end
