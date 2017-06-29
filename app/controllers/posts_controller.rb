class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
      if @post.save
      redirect_to posts_path(@post)
      else
      redirect_to new_post_path
      end
    end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    puts params
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.location = params[:post][:location]
    @post.category = params[:post][:category]
    @post.body = params[:post][:body]
    @post.save

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  private
    def post_params
      params.require(:post).permit(:title, :category, :location, :body, :password)
    end
end
