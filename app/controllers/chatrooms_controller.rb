class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @chatroom = current_user.chatroom_with(@artist.user)
    unless @chatroom
      @chatroom = Chatroom.create(user: current_user)
      @conversation = Conversation.create(chatroom: @chatroom, user: @artist.user)
    end
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
