class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: params[:comment][:text], user_id: current_user.id)

    comment.save

    ActionCable.server.broadcast "comments_channel",
                                  comment: comment,
                                  user: current_user,
                                  post: comment.post,
                                  avatar: url_for(current_user.avatar)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end
end
