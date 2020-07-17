class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms.order(last_message: :desc).distinct
  end

  def init_chat
    rooms = Room.joins(messages: :user).where(users: { id: current_user.id }) &
            Room.joins(messages: :user).where(users: { id: params[:id] })

    room = nil

    if rooms.empty?
      room = Room.new
      if room.save
        Message.create(user_id: params[:id], room_id: room.id, body: 'nil', unread: false)
        message = Message.create(user_id: current_user.id, room_id: room.id, body: 'Hi', unread: true)

        room.update(last_message: message.created_at)

        ActionCable.server.broadcast(
          'message_notice_channel',
          notified_room: room, user: current_user.id, side_user: params[:id]
        )
      else
        redirect_to request.referrer, alert: 'sorry we couldn\'t initiate the chat Server error, try again.'
      end
    else
      room = rooms[0]
    end

    redirect_to room_path(room)
  end

  def show
    @message_number = nil

    Room.find(params[:id]).messages.where('unread = true and user_id != ?', current_user.id).update(unread: false)

    @room = Room.find(params[:id])
    @messages = @room.messages.order(created_at: :asc)
    @rooms = current_user.rooms.order(last_message: :desc).distinct
    render 'index'
  end
end
