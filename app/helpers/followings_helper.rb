module FollowingsHelper
  def there_is_no_users?
    if @users.empty?
      render 'no_one_to_follow'
    end
  end
end
