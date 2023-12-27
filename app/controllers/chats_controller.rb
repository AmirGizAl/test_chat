class ChatsController < ApplicationController
  respond_to :html, :json
  def index
    @chats = Chat.order(created_at: :desc)
  end

  def show
    @chat = Chat.find_by!(title: params[:title])
    @messages = @chat.messages.includes(:user)
    @new_message = current_user&.messages&.build(chat: @chat)
  end

  def create
    @new_chat = Chat.new(title: params[:title])

    if @new_chat.save
      @new_chat.broadcast_prepend_to :chats
    else
      redirect_to root_path, alert: "Имя чата не может быть пустым!"
    end
  end

  def api_index
    @chats = Chat.order(created_at: :desc)
    respond_with @chats
  end
end
