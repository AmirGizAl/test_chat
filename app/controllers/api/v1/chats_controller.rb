module Api
  module V1
    class ChatsController < ApplicationController
      def index
        @chats = Chat.order(created_at: :desc)
        render json: @chats
      end
    end
  end
end