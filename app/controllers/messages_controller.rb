class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
        head :ok
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      # Si la sauvegarde échoue, nous devrions recharger la vue chatroom/show
      # et afficher les erreurs. Utilisez flash.now pour afficher les erreurs
      flash.now[:alert] = "Message could not be saved."
      render 'chatrooms/show', status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
