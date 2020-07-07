class MessageNoticeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_notice_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
