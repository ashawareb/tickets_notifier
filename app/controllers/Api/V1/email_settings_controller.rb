module Api
  module V1
    class EmailSettingsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :find_email_setting, only: %i[update]

      def update
        if @email_setting.update(email_setting_params)
          render json: @email_setting, serializer: Api::V1::EmailSettingSerializer, status: :ok
        else
          render json: { errors: @email_setting.errors.full_message }, status: :unprocessable_entity
        end
      end

      private

      def email_setting_params
        params.require(:email_setting).permit(:due_date_reminder_email_interval, :due_date_reminder_email_time, :send_due_date_reminder_email)
      end

      def find_email_setting
        @email_setting = EmailSetting.find_by(id: params[:id])
        render json: { errors: ['Email Setting Cannot Be Blank'] }, status: :not_found unless @email_setting
      end
    end
  end
end
