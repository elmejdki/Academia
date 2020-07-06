class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user.all_out_users
  end

  def create
    @following = Following.new(followed_id: params[:followed_id], follower_id: current_user.id)

    if @following.save
      redirect_to request.referrer, notice: 'you follow was successfull.'
    else
      redirect_to request.referrer, alert: 'Server error, sorry try again.'
    end
  end

  def destroy
    following = Following.where(follower: current_user, followed: User.find(params[:id])).first
    following.destroy
    redirect_to request.referrer, alert: 'relationship was canceled.'
  end
end
