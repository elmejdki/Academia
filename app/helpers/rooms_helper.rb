module RoomsHelper
  def there_is_no_room?
    render 'no_room' if @rooms.empty?
  end

  def get_rooms(room)
    user = room.side_user(current_user)

    render partial: 'room_link', locals: { room: room, user: user } if user
  end

  def get_room_user_image(user, class_name)
    if user.avatar.attached?
      render partial: 'room_user_image', locals: { user: user, className: class_name }
    else
      render partial: 'room_user_fake_image', locals: { className: class_name }
    end
  end

  def get_message_notice(room)
    return unless room.messages.last.user_id != current_user.id && room.messages.last.unread

    render 'message_notice'
  end

  def render_room
    if @room.present?
      render 'message_box'
    else
      render 'select_room'
    end
  end

  def get_message_text(msg, index)
    return if msg.body == 'nil'

    render 'message_ruler' if index == @message_number

    render partial: 'message', locals: { msg: msg }
  end

  def sender?(msg)
    current_user == msg.user ? 'bg-base' : ''
  end

  def active_room?(room)
    'active-room' if room == @room
  end
end
