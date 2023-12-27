class MessagesController < ApplicationController
  def create
    @new_message = current_user&.messages&.build(strong_params)

    if @new_message.save
      chat = @new_message&.chat
      @new_message&.broadcast_append_to chat
    end
  end

  private

  def strong_params
    params.require(:message).permit(:content, :chat_id)
  end
end
