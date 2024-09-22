module Api
  module V1
    class TicketsController < ApplicationController
      before_action :find_user, only: %i[create]

      def index
        tickets = Ticket.all
        render json: tickets, each_serializer: Api::V1::TicketSerializer, status: :ok
      end

      def create
        ticket = @user.tickets.new(ticket_params)
        if ticket.save
          render json: ticket, serializer: Api::V1::TicketSerializer, status: :created
        else
          render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def ticket_params
        params.require(:ticket).permit(:title, :description, :due_date, :status)
      end

      def find_user
        @user = User.find_by(id: params[:user_id])
        render json: { errors: ['User Cannot Be Blank'] }, status: :not_found unless @user
      end
    end
  end
end
