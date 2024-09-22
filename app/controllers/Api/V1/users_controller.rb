module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        users = User.all
        render json: users, each_serializer: Api::V1::UserSerializer, status: :ok
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, serializer: Api::V1::UserSerializer, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :time_zone)
      end
    end
  end
end
