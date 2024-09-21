class TicketMailer < ApplicationMailer
  default from: 'no-reply@planradr.com'

  def reminder(ticket)
    @ticket = ticket
    @user = @ticket.user
    mail(to: @user.email, subject: "Ticket Reminder")
  end
end
