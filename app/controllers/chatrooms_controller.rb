class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = Chatroom.first
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
