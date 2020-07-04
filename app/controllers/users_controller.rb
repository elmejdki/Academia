class UsersController < ApplicationController
  def show
    @user = User.includes(:posts, :followers).find(params[:id])
    @post = Post.new
  end
end
