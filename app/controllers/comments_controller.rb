class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)
    comment.user_id = current_user.id

    if comment.save
      ActionCable.server.broadcast(
        'comments_channel',
        comment: comment,
        user: current_user,
        post: comment.post,
        avatar: url_for(current_user.avatar)
      )
    else
      redirect_to request.referrer, alert: 'comment wasn\'t added, Server error, please try again'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      # I don't want to refresh the page
    else
      redirect_to request.referrer, alert: 'comment wasn\'t desroyed, Server error, please try again'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
