class LikesController < ApplicationController
  def action
    @post = Post.find(params[:post_id])

    if !@post.isliked?(current_user)
      like
    else
      dislike
    end
  end

  def like
    like = @post.likes.build(user_id: current_user.id)

    if like.save
      # I don't want to referesh the page
    else
      redirect_to request.referrer, alert: 'reaction wasn\'t taked on account cause of a server error, please try again'
    end
  end

  def dislike
    like = @post.likes.where(user_id: current_user.id).first
    if like.destroy
        # I don't want to referesh the page
    else
      redirect_to request.referrer, alert: 'reaction wasn\'t taked on account cause of a server error, please try again'
    end
  end
end
