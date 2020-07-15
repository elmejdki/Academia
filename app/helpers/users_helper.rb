module UsersHelper
  def error_action(field)
    render partial: 'error_handler', locals: { source: field } if resource.errors[field].any?
  end

  def get_post_form(user, post)
    if user == current_user
      render partial: 'post_form', locals: { post: post }
    end
  end

  def get_no_posts_paraghraph(user)
    if user.posts.empty?
      render 'no_posts'
    end
  end

  def get_heart(post)
    if post.isliked?(current_user)
      render 'empty_heart'
    else
      render 'filled_heart'
    end
  end

  def get_edit_and_remove(post)
    if current_user == post.author
      render partial: 'edit_remove_btns', locals: { post: post }
    end
  end

  def get_comment_trash_btn(post, comment)
    if current_user == comment.user
      render partial: 'comment_trash_btn', locals: { post: post, comment: comment }
    end
  end

  def there_is_no_followings?
    if @user.followings.empty?
      render 'no_followings'
    end
  end

  def there_is_no_followers?
    if @user.followers.empty?
      render 'no_followers'
    end
  end
end
