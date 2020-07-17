module UsersHelper
  def error_action(field)
    render partial: 'error_handler', locals: { source: field } if resource.errors[field].any?
  end

  def get_post_form(user, post)
    render partial: 'post_form', locals: { post: post } if user == current_user
  end

  def get_no_posts_paraghraph(user)
    render 'no_posts' if user.posts.empty?
  end

  def get_heart(post)
    if post.isliked?(current_user)
      render 'empty_heart'
    else
      render 'filled_heart'
    end
  end

  def get_edit_and_remove(post)
    render partial: 'edit_remove_btns', locals: { post: post } if current_user == post.author
  end

  def get_comment_trash_btn(post, comment)
    return unless current_user == comment.user

    render partial: 'comment_trash_btn', locals: { post: post, comment: comment }
  end

  def there_is_no_followings?
    render 'no_followings' if @user.followings.empty?
  end

  def there_is_no_followers?
    render 'no_followers' if @user.followers.empty?
  end
end
