class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:followers, posts: [{ comments: :user }, :author, :likes]).find(params[:id])
    @post = Post.new
    @comment = Comment.new
  end
end
