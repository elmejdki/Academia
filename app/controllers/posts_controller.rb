class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.followings_and_own_posts
    @post = Post.new
    @comment = Comment.new
  end

  def create
    post = current_user.posts.new(post_params)

    if post.save
      redirect_to request.referrer, notice: 'post was created successfuly.'
    else
      redirect_to request.referrer, alert: 'post was not created please try again.'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(text: params[:post][:text])
      redirect_to root_path, notice: 'Your post was updated successfully.'
    else
      redirect_to request.referrer, alert: 'Your post couldn\'t be updated, please try again.'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to request.referrer, notice: 'post deleted succesfully'
  end

  private
  
  def post_params 
    params.require(:post).permit(:text)
  end
end
