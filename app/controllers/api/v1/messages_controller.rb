module Api
  module V1
    class MessagesController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]

      def create
        @new_message = Message.new(strong_params)

        if @new_message.save
          chat = @new_message.chat
          @new_message.broadcast_append_to chat
          render json: @new_message, status: :created
        else
          render json: { errors: @new_message.errors.full_messages }
        end
      end

      private

      def strong_params
        { content: params[:message][:content], chat_id: find_chat_id_by_title(params[:message][:chat_title]) }
      end

      def find_chat_id_by_title(title)
        chat = Chat.find_by(title: title)
        chat&.id
      end
    end
  end
end
