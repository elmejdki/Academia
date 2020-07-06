class LikesController < ApplicationController
  def action
    @post = Post.find(params[:post_id])

    unless @post.isliked?(current_user)
      like
    else
      dislike
    end
  end

  def like
    like = @post.likes.new(user_id: current_user.id)
    like.save
  end

  def dislike
    like = @post.likes.where(user_id: current_user.id).first
    like.destroy
  end
end
