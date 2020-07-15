module PostsHelper
  def get_heart(post)
    if post.isliked?(current_user)
      render 'empty_heart'
    else
      render 'filled_heart'
    end
  end
  
  def get_edit_and_remove_btns(post)
    if current_user == post.author
      render partial: 'edit_remove_btns', locals: { post: post }
    end
  end

  def get_comment_trash(post, comment)
    if current_user == comment.user
      render partial: 'trash_btn', locals: { post: post, comment: comment }
    end
  end
end
