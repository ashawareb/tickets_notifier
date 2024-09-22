module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email

      has_one :email_setting
      has_many :tickets
    end
  end
end

