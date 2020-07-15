module RoomsHelper
  def there_is_no_room?
    if @rooms.empty?
      render 'no_room'
    end
  end

  def get_rooms(room)
    user = room.side_user(current_user)

    if user
      render partial: 'room_link', locals: { room: room, user: user }
    end
  end

  def get_room_user_image(user, className)
    if user.avatar.attached?
      render partial: 'room_user_image', locals: { user: user, className: className }
    else
      render partial: 'room_user_fake_image', locals: { className: className }
    end
  end

  def get_message_notice(room)
    if room.messages.last.user_id != current_user.id && room.messages.last.unread
      render 'message_notice'
    end
  end

  def get_room
    if @room.present?
      render 'message_box'
    else
      render 'select_room'
    end
  end

  def get_message_text(msg, index)
    unless msg.body == "nil"
      if index == @message_number
        render 'message_ruler'
      end
     
      render partial: 'message', locals: { msg: msg }
    end
  end
end
