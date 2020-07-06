class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
