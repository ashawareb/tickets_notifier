class TicketDueToEmailReminderJob
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)
    TicketMailer.reminder(ticket).deliver_now
  end
end
