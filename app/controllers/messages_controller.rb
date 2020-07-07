class MessagesController < ApplicationController
  def create
    @message = Message.new(messages_params)
    @message.user = current_user
    @message.unread = true
    @message.save

    room = Room.find(@message.room.id)
    room.update(last_message: @message.created_at)

    user = room.side_user(current_user)

    ActionCable.server.broadcast "rooms_channel_#{@message.room.id}",
                                  message: @message,
                                  user: current_user.id

    ActionCable.server.broadcast "message_notice_channel",
                                  notified_room: @message.room,
                                  user: current_user.id,
                                  side_user: user.id,
                                  dead_rooms: check_if_there_is_new_messages(user)
  end

  private

  def messages_params
    params.require(:message).permit(:body, :room_id, :user_id)
  end
end
