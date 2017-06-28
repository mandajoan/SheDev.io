class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new({
      title: params[:post][:title],
      category: params[:post][:category],
      body: params[:post][:body]
      })
    @post.user = current_user
      if @post.save
      redirect_to post_path(@post)
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
    @post.category = params[:post][:category]
    @post.body = params[:post][:body]
    @post.save

    redirect_to post_path(@post)
  end

  def destroy
  end
end
