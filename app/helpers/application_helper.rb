module ApplicationHelper
  def current_class?(test_path)
    return 'active text-white' if request.path == test_path

    ''
  end

  def add_user_image(user)
    if user.avatar.attached?
      render partial: 'avatar_user_image', locals: { user: user }
    else
      render 'avatar_user_fake_image'
    end
  end

  def add_rounded_user_image(user)
    if user.avatar.attached?
      render partial: 'rounded_user_image', locals: { user: user }
    else
      render partial: 'rounded_user_fake_image'
    end
  end

  def get_follower(person)
    if !person.followed_by.nil?
      render partial: 'followed_by', locals: { user: person }
    else
      render 'no_follower'
    end
  end

  def no_followers_message(followers)
    render 'no_followers' if followers.empty?
  end

  def get_user_follower(follower)
    if !follower.followed_by.nil?
      if follower.followed_by.follower == current_user
        render 'me_follower'
      else
        render partial: 'followed_by_2', locals: { follower: follower }
      end
    else
      render 'no_follower'
    end
  end

  def render_add_or_remove_btn(follower)
    return if follower == current_user

    if current_user.following?(follower)
      render partial: 'minus_btn', locals: { follower: follower }
    else
      render partial: 'plus_btn', locals: { follower: follower }
    end
  end

  def render_edit_or_follow_btn(user)
    if user == current_user
      render 'edit_btn'
    else
      render_add_or_remove_btn(user)
    end
  end

  def get_profile_image(user)
    if user.avatar.attached?
      render partial: 'profile_image', locals: { user: user }
    else
      render 'fake_profile_image'
    end
  end

  def get_message_btn(user)
    if current_user == user
      render 'hamburger'
    else
      render 'message_btn'
    end
  end

  def get_cover_image(user)
    if user.cover_picture.attached?
      render partial: 'cover_image', locals: { user: user }
    else
      render 'fake_cover_image'
    end
  end

  def render_side_bar
    render 'left_side_bar' if user_signed_in?
  end

  def render_top_bar
    if user_signed_in?
      render 'navbar_links'
    else
      render 'log_in_links'
    end
  end

  def hide_messages_notice(unread)
    unread.nil? || unread.zero? ? 'd-none' : ''
  end

  def get_alert_class(alert)
    'alert' if alert
  end

  def get_message(message)
    message
  end

  def render_notification(notice, alert)
    return unless notice || alert

    render partial: 'notification', locals: { notice: notice, alert: alert }
  end
end
