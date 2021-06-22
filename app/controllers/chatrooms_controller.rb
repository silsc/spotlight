class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms
  end

  def create
    if params[:user_type] == "artist"
      @profile = Artist.find(params[:profile_id])
    else
      @profile = Label.find(params[:profile_id])
    end
    @chatroom = current_user.chatroom_with(@profile.user)
    unless @chatroom
      @chatroom = Chatroom.create(user: current_user)
      @conversation = Conversation.create(chatroom: @chatroom, user: @profile.user)
    end
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatrooms = current_user.chatrooms
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
