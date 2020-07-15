module FollowingsHelper
  def there_is_no_users?
    render 'no_one_to_follow' if @users.empty?
  end
end
